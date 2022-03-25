package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.EspecializacaoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EspecializacaoService {

	@Autowired
	private CurriculoRepository curriculoRepository;

	public Especializacao buscarOuFalhar(Long especializacaoId) {
		log.info("C=EspecializacaoService, M=buscarOuFalhar, buscando especializacao de id {}", especializacaoId);

		return curriculoRepository.buscarEspecializacaoPorId(especializacaoId)
				.orElseThrow(() -> new EspecializacaoNaoEncontradoException(especializacaoId));

	}
	
	public List<Especializacao> listar(){
		log.info("C=EspecializacaoService, M=listar, buscando especializacoes ");
		
		return curriculoRepository.listarEspecializacoes();
		
	}

}
