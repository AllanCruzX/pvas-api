package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.repository.GrupoRepository;
import com.ikesocial.pvas.domain.service.GrupoConstants;

@Component
public class ManipuladorDeGrupoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private GrupoRepository grupoRepository;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.isNovo()) {

		Optional<Grupo> grupo = grupoRepository.findById(GrupoConstants.USUARIO);

		assistenteSocial.adicionarGrupo(grupo.get());
		}
		
		return tratarProximo(assistenteSocial);
		
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUINTO;
	}

}
