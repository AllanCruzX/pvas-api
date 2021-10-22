package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorEmpresaAtual;
import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorEmpressaPassada;
import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorSemExperiencia;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalEmUsoException;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.repository.ExperienciaProfissionalRepository;

@Service
public class CadastroExperienciaProfissionalService {

	@Autowired
	private ExperienciaProfissionalRepository experienciaProfissionalRepository;


	@Transactional
	public ExperienciaProfissional salvar(ExperienciaProfissional experienciaProfissional ) {

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

}
