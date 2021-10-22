package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.service.CadastroEspecializacaoService;

@Component
public class ManipuladorDeEspecializacaoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroEspecializacaoService especializacaoService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.getEspecializacoes() != null && !assistenteSocial.getEspecializacoes().isEmpty()) {

			Set<Especializacao> especializacoes = assistenteSocial.getEspecializacoes().stream()
					.map(especializacao -> especializacaoService.buscarOuFalhar(especializacao.getId()))
					.collect(Collectors.toSet());

			assistenteSocial.setEspecializacoes(especializacoes);
		}

		return tratarProximo(assistenteSocial);
	}

	@Override
	public Integer getPrioridade() {
		return 6;
	}

}
