package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.EspecializacaoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.repository.EspecializacaoRepository;

@Service
public class CadastroEspecializacaoService {

	@Autowired
	private EspecializacaoRepository especializacaoRepository;
	
	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;

	public Especializacao buscarOuFalhar(Long especializacaoId) {

		return especializacaoRepository.findById(especializacaoId)
				.orElseThrow(() -> new EspecializacaoNaoEncontradoException(especializacaoId));

	}
	
	public Set<Especializacao> lietarEspecializacoesAssistenteSocial(String codigoAssistenteSocial) {
		AssistenteSocial assistenteSocialRecuperada = cadastroAssistenteSocialService.buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		Optional<AssistenteSocial> assistenteSocial = especializacaoRepository.lirtarEspecializacoesAssistenteSocial(assistenteSocialRecuperada.getCodigo());

		return assistenteSocial.get().getEspecializacoes();
	}

}
