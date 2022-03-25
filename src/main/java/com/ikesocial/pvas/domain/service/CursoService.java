package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.CursoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CursoService {

	@Autowired
	private CurriculoRepository curriculoRepository;
	
	@Autowired
	private CadastroCurriculoService cadastroCurriculoService;

	public Curso buscarOuFalhar(Long cursoId) {
		log.info("C=CursoService, M=buscarOuFalhar, Buscando curso com o id {}",cursoId);
		
		return curriculoRepository.buscarCursoPorId(cursoId)
				.orElseThrow(() -> new CursoNaoEncontradoException(cursoId));
	}
	
	public List<Curso> listarCursosDoCurriculo(Long curriculoId){
		log.info("C=CursoService, M=listarCursosDoCurriculo, Buscando curso do curriculo com o id {}",curriculoId);
		
		Curriculo curriculo = cadastroCurriculoService.buscarOuFalharLazy(curriculoId);
		
		List<Curso> cursos = curriculoRepository.lirtarCursosDoCurriculo(curriculo.getId());
		
		return cursos;
	}
	
	public boolean existeCursoParaOCurriculo(Long curriculoId, Long cursoId) {
		log.info("C=CursoService, M=existeCursoParaOCurriculo, verificando curriculo id {} , curso do id {}",curriculoId , cursoId);

		if (!curriculoRepository.existeCursoNoBancoParaOCurriculo(curriculoId, cursoId)) {
			throw new NegocioException("O curso ja esta associado a um curriculo");
		} else {
			return true;
		}

	}


}
