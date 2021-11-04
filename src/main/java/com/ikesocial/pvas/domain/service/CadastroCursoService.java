package com.ikesocial.pvas.domain.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.ikesocial.pvas.domain.exception.CursoEmUsoException;
import com.ikesocial.pvas.domain.exception.CursoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.repository.CursoRepository;

@Service
public class CadastroCursoService {

	private static final String CURSO_EM_USO = "O curso de id %d, já está associado a uma assistente social";

	@Autowired
	private CursoRepository cursoRepository;

	@Autowired
	private CadastroAssistenteSocialService pessoaFisicaService;

	@Transactional
	public Curso salvar(Curso curso) {

		cursoRepository.detach(curso);

		preparaCurso(curso);

		return cursoRepository.save(curso);
	}

	private void preparaCurso(Curso curso) {

		AssistenteSocial assistenteSocial = pessoaFisicaService
				.buscarOuFalharAssistenteSocialSemComplementos(curso.getAssistenteSocial().getCodigo());

		curso.setAssistenteSocial(assistenteSocial);
	}

	@Transactional
	public void excluir(Long cursoId) {

		try {

			cursoRepository.deleteById(cursoId);
			cursoRepository.flush();

		} catch (EmptyResultDataAccessException e) {
			throw new CursoNaoEncontradoException(cursoId);

		} catch (DataIntegrityViolationException e) {
			throw new CursoEmUsoException(cursoId);
		}

	}

	public Curso buscarOuFalhar(Long cursoId) {
		return cursoRepository.findById(cursoId).orElseThrow(() -> new CursoNaoEncontradoException(cursoId));
	}

	public boolean existeCursoParaOAssistenteSocial(String CodigoAssistenteSocial, Long cursoId) {

		if (!cursoRepository.existeNoBancoIncluindoSemAssistenteSocial(CodigoAssistenteSocial, cursoId)) {
			throw new NegocioException("O curso já está associado a uma assistente social");
		} else {
			return true;
		}

	}

	public Curso buscarOuFalharCursoDisponivel(Long cursoId, String codigoAssistenteSocial) {

		Optional<Curso> curso = cursoRepository.buscarCursoComAssistenteSocial(cursoId);

		if (curso.isPresent()) {

			if (curso.get().getAssistenteSocial() != null && !StringUtils.hasText(codigoAssistenteSocial)) {
				throw new NegocioException(
						String.format(CURSO_EM_USO, cursoId));
				
			} else if (curso.get().getAssistenteSocial() != null && StringUtils.hasText(codigoAssistenteSocial)
					&& !codigoAssistenteSocial.equals(curso.get().getAssistenteSocial().getCodigo())) {
				throw new NegocioException(
						String.format(CURSO_EM_USO, cursoId));
			}

		} else {
			throw new CursoNaoEncontradoException(cursoId);
		}

		return curso.get();

	}

}
