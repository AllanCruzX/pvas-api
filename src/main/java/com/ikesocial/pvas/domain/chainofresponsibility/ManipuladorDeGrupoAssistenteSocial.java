package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.repository.GrupoRepository;
import com.ikesocial.pvas.domain.service.GrupoConstants;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeGrupoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private GrupoRepository grupoRepository;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.isNovo()) {

		Optional<Grupo> grupo = grupoRepository.findById(GrupoConstants.USUARIO);

		assistenteSocial.adicionarGrupo(grupo.get());
		
		log.info("Preparando grupo do id {} ", grupo.get().getId());
		}
		
		return tratarProximo(assistenteSocial);
		
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUINTO;
	}

}
