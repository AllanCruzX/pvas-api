package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ExperienciaProfissionalService {

	@Autowired
	private CurriculoRepository curriculoRepository;
	
	@Autowired
	private CadastroCurriculoService cadastroCurriculoService;

	public ExperienciaProfissional buscarOuFalhar(Long experienciaProfissionalId) {
		log.info("C=ExperienciaProfissionalService, M=buscarOuFalhar, Buscando experiancia profissional do id {}",experienciaProfissionalId);

		return curriculoRepository.buscarExperienciasProfissionalPorId(experienciaProfissionalId)
				.orElseThrow(() -> new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId));

	}
	
	public List<ExperienciaProfissional> listarExperienciasProfissionaisPorCurriculo(Long curriculoId){
		log.info("C=ExperienciaProfissionalService, M=listarExperienciasProfissionaisPorCurriculo, Buscando experiancia  com o id do curriculo {}",curriculoId);
		
		Curriculo curriculo = cadastroCurriculoService.buscarOuFalharLazy(curriculoId);
		
		return curriculoRepository.lirtarExperienciasProfissionaisDoCurriculo(curriculo.getId());
	}
	
	public boolean existeExperienciaProfissionalParaOCurriculo(Long curriculoId, Long experienciaProfissionalId) {
		log.info("C=ExperienciaProfissionalService, M=existeExperienciaProfissionalParaOCurriculo, verificando curriculo id {} , experiancia do id {}",curriculoId , experienciaProfissionalId);

		if (!curriculoRepository.existeExperienciaProfissionalNoBancoParaOCurriculo(curriculoId, experienciaProfissionalId)) {
			throw new NegocioException("A experiencia profissional ja esta associado a um curriculo");
		} else {
			return true;
		}

	}

}
