package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.EspecializacaoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.repository.EspecializacaoRepository;

@Service
public class CadastroEspecializacaoService {

	@Autowired
	private EspecializacaoRepository especializacaoRepository;

	public Especializacao buscarOuFalhar(Long especializacaoId) {

		return especializacaoRepository.findById(especializacaoId)
				.orElseThrow(() -> new EspecializacaoNaoEncontradoException(especializacaoId));

	}

}
