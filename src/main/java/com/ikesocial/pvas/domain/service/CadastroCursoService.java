package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.CursoEmUsoException;
import com.ikesocial.pvas.domain.exception.CursoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.repository.CursoRepository;

@Service
public class CadastroCursoService {

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
		
		PessoaFisica pessoaFisica = pessoaFisicaService.buscarOuFalharAssistenteSocialSemComplementos(curso.getPessoaFisica().getCodigo());
		
		curso.setPessoaFisica(pessoaFisica);
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
		return cursoRepository.findById(cursoId)
				.orElseThrow(() -> new CursoNaoEncontradoException(cursoId));
	}

}
