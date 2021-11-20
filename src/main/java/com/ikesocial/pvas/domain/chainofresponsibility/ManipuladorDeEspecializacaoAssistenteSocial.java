package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.service.CadastroEspecializacaoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeEspecializacaoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroEspecializacaoService especializacaoService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {
		log.info("Preparando especializacao, do Assistente social {}", assistenteSocial.getNome());

		if (assistenteSocial.temEspecializacao()) {

			Set<Especializacao> especializacoes = assistenteSocial.getEspecializacoes().stream()
					.map(especializacao -> preparaEspecializacao(especializacao, assistenteSocial))
					.collect(Collectors.toSet());

			assistenteSocial.setEspecializacoes(especializacoes);
		}

		return tratarProximo(assistenteSocial);
	}
	
	private Especializacao preparaEspecializacao(Especializacao especializacao, AssistenteSocial assistenteSocial) {
		
		Especializacao especializacaoRecuperada = especializacaoService.buscarOuFalhar(especializacao.getId());
		
		logExpecializacao(especializacaoRecuperada, assistenteSocial);
		
		return especializacaoRecuperada;
	}
	
	private void logExpecializacao(Especializacao especializacao, AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.temCodigo()) {
			log.info("Preparando especializacao do id {} , para o assistente social do codigo {}", especializacao.getId() ,assistenteSocial.getCodigo());
		}else{
			log.info("Preparando especializacao do id {}", especializacao.getId() );
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SEXTO;
	}

}
