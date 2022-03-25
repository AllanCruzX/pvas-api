package com.ikesocial.pvas.domain.chainofresponsibility.profissional;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.repository.GrupoRepository;
import com.ikesocial.pvas.domain.service.GrupoConstants;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeGrupoDoProfissional extends ManipuladorDeProfissionalBase {

	@Autowired
	private GrupoRepository grupoRepository;

	@Override
	public boolean tratar(Profissional profissional) {
		
		logGrupo(profissional);
		
		if(profissional.isNovo()) {

		Optional<Grupo> grupo = grupoRepository.findById(GrupoConstants.USUARIO);

		profissional.adicionarGrupo(grupo.get());
		
		}
		
		return tratarProximo(profissional);
		
	}
	
	private void logGrupo(Profissional profissional) {
		
		if(profissional.temCodigo()) {
			log.info("C=ManipuladorDeGrupoDoProfissional, M=logGrupo, preparando grupo para o profissional do codigo {}", profissional.getCodigo());
		}else{
			log.info("C=ManipuladorDeGrupoDoProfissional, M=logGrupo, preparando grupo");
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUARTO;
	}

}
