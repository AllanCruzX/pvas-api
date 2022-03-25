package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.IdiomaNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IdiomaService {

	@Autowired
	private CurriculoRepository curriculoRepository;


	public Idioma buscarOuFalhar(Long idiomaId) {
		log.info("C=IdiomaService, M=buscarOuFalhar, buscando idioma de id {}", idiomaId);
		
		return curriculoRepository.buscarIdiomaPorId(idiomaId)
				.orElseThrow(() -> new IdiomaNaoEncontradoException(idiomaId));
	}
	
	public List<Idioma> listar(){
		log.info("C=IdiomaService, M=listar, consultando idiomas ");
		
		return curriculoRepository.listarIdiomas();
	}

}