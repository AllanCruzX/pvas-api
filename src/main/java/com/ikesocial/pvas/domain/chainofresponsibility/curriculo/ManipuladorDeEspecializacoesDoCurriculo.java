package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.service.EspecializacaoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeEspecializacoesDoCurriculo extends ManipuladorDeCurriculoBase {

	@Autowired
	private EspecializacaoService especializacaoService;

	@Override
	public boolean tratar(Curriculo curriculo) {

		if (curriculo.temEspecializacao()) {

			Set<Especializacao> especializacoes = curriculo.getEspecializacoes().stream()
					.map(especializacao -> preparaEspecializacao(especializacao)).collect(Collectors.toSet());

			curriculo.setEspecializacoes(especializacoes);
		}

		return tratarProximo(curriculo);
	}

	private Especializacao preparaEspecializacao(Especializacao especializacao) {
		log.info(
				"C=ManipuladorDeEspecializacoesDoCurriculo, M=preparaEspecializacao, preparando especializacao do id {}",
				especializacao.getId());

		return especializacaoService.buscarOuFalhar(especializacao.getId());

	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.TERCEIRO;
	}

}
