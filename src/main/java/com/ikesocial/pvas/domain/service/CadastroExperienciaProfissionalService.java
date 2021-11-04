package com.ikesocial.pvas.domain.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorEmpresaAtual;
import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorEmpressaPassada;
import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorSemExperiencia;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalEmUsoException;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.repository.ExperienciaProfissionalRepository;

@Service
public class CadastroExperienciaProfissionalService {
	private static final String EXPERIENCIA_PROFISSIONAL_EM_USO = "A experiência profissional de id %d, já está associado a uma assistente social";

	@Autowired
	private ExperienciaProfissionalRepository experienciaProfissionalRepository;

	@Transactional
	public ExperienciaProfissional salvar(ExperienciaProfissional experienciaProfissional) {

		experienciaProfissionalRepository.detach(experienciaProfissional);

		preparaExperienciaProfissional(experienciaProfissional);

		return experienciaProfissionalRepository.save(experienciaProfissional);
	}

	public ExperienciaProfissional buscarOuFalhar(Long experienciaProfissionalId) {

		return experienciaProfissionalRepository.findById(experienciaProfissionalId)
				.orElseThrow(() -> new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId));

	}

	private void preparaExperienciaProfissional(ExperienciaProfissional experienciaProfissional) {

		ManipuladorSemExperiencia manipulador = new ManipuladorSemExperiencia();
		manipulador.setManipuladorProximo(new ManipuladorEmpresaAtual())
				.setManipuladorProximo(new ManipuladorEmpressaPassada());

		manipulador.tratar(experienciaProfissional);
	}

	@Transactional
	public void excluir(Long experienciaProfissionalId) {

		try {

			experienciaProfissionalRepository.deleteById(experienciaProfissionalId);
			experienciaProfissionalRepository.flush();

		} catch (EmptyResultDataAccessException e) {
			throw new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId);

		} catch (DataIntegrityViolationException e) {
			throw new ExperienciaProfissionalEmUsoException(experienciaProfissionalId);
		}

	}


	public ExperienciaProfissional buscarOuFalharExperienciaProfissionalDisponivel(Long experienciaProfissionalId, String codigoAssistenteSocial) {

		Optional<ExperienciaProfissional> experienciaProfissional = experienciaProfissionalRepository
																				.buscarExperienciaProfissionalComAssistenteSocial(experienciaProfissionalId);

		if (experienciaProfissional.isPresent()) {

			if (experienciaProfissional.get().getAssistenteSocial() != null	&& !StringUtils.hasText(codigoAssistenteSocial)) {
				throw new NegocioException(String.format(EXPERIENCIA_PROFISSIONAL_EM_USO, experienciaProfissionalId));

			} else if (experienciaProfissional.get().getAssistenteSocial() != null
					&& StringUtils.hasText(codigoAssistenteSocial) && !codigoAssistenteSocial
							.equals(experienciaProfissional.get().getAssistenteSocial().getCodigo())) {
				throw new NegocioException(String.format(EXPERIENCIA_PROFISSIONAL_EM_USO, experienciaProfissionalId));
			}

		} else {
			throw new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId);
		}

		return experienciaProfissional.get();

	}

}
