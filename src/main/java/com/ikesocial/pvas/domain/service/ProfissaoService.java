package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.ProfissaoNaoEncontradaException;
import com.ikesocial.pvas.domain.model.Profissao;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfissaoService {

	@Autowired
	private CurriculoRepository curriculoRepository;

	public Profissao buscarOuFalhar(Long profissaoId) {
		log.info("C=ProfissaoService,M=buscarOuFalhar, Consultando profissao de id {}" , profissaoId);

		return curriculoRepository.buscarProfissaoPorId(profissaoId)
				.orElseThrow(() -> new ProfissaoNaoEncontradaException(profissaoId));
	}
	
	public List<Profissao> listar(){
		log.info("C=ProfissaoService,M=listar, Consultando profissoes");
		
		return curriculoRepository.listarProfissoes();
	}

}