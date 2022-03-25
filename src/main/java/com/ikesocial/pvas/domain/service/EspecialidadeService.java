package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.EspecialidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EspecialidadeService {

	@Autowired
	private CurriculoRepository curriculoRepository;


	public Especialidade buscarOuFalhar(Long especialidadeId) {
		log.info("C=EspecialidadeService,M=buscarOuFalhar, Consultando especialidade de id {}" , especialidadeId);


		return curriculoRepository.buscarEspecialidadePorId(especialidadeId)
				.orElseThrow(() -> new EspecialidadeNaoEncontradoException(especialidadeId));
	}
	
	public List<Especialidade> listar(){
		log.info("C=EspecialidadeService, M=listar, Consultando especialidades");

		return curriculoRepository.listarEspecialidades();
	}

}