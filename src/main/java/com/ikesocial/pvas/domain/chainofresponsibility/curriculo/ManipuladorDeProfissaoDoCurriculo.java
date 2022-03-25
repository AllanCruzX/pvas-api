package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Profissao;
import com.ikesocial.pvas.domain.service.ProfissaoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeProfissaoDoCurriculo extends ManipuladorDeCurriculoBase {
	
	@Autowired
	private ProfissaoService profissaoService;

	@Override
	public boolean tratar(Curriculo curriculo) {
			
			Set<Profissao> profissoes = curriculo.getProfissoes()
							.stream()
							.map(profissao ->preparaProfissao(profissao))
							.collect(Collectors.toSet());
			
				curriculo.setProfissoes(profissoes);

		return tratarProximo(curriculo);
	}
	
	private Profissao preparaProfissao(Profissao profissao) {
		log.info("C=ManipuladorDeProfissaoDoCurriculo, M=preparaProfissao, preparando profissao do id {}", profissao.getId());
		
		return profissaoService.buscarOuFalhar(profissao.getId());
		
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SEXTO;
	}

}
