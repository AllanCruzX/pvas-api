package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.SubEspecialidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SubEspecialidadeService {

	@Autowired
	private CurriculoRepository curriculoRepository;
	
	@Autowired
	private EspecialidadeService especialidadeService;

	public SubEspecialidade buscarOuFalhar(Long subEspecialidadeId) {
		log.info("C=SubEspecialidadeService,M=buscarOuFalhar, Consultando sub-especialidades de id {}" , subEspecialidadeId);

		return curriculoRepository.buscarSubEspecialidadePorId(subEspecialidadeId)
				.orElseThrow(() -> new SubEspecialidadeNaoEncontradoException(subEspecialidadeId));

	}
	
	public List<SubEspecialidade> listarPorEspecialidade(Long especialidadeId){
		log.info("C=SubEspecialidadeService,M=listarPorEspecialidade, Consultando sub-especialidades pela especialidade de id {}" , especialidadeId);
		
	      Especialidade especialidade =  especialidadeService.buscarOuFalhar(especialidadeId);
		
		return curriculoRepository.listarSubEspecialidadesPorEspecialidade(especialidade.getId());
		
	}

}
