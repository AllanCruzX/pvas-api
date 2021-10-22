package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.service.CadastroIdiomaService;

@Component
public class ManipuladorDeIdiomaAssistenteSocial extends ManipuladorDeAssitenteSocialBase {
	
	@Autowired
	private CadastroIdiomaService idiomaService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if(assistenteSocial.getIdiomas() != null && !assistenteSocial.getIdiomas().isEmpty()) {
			
			Set<Idioma> idiomas = assistenteSocial.getIdiomas()
							.stream()
							.map(idioma -> idiomaService.buscarOuFalhar(idioma.getId()))
							.collect(Collectors.toSet());
			
				assistenteSocial.setIdiomas(idiomas);
			}

		return tratarProximo(assistenteSocial);
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.OITAVO;
	}

}


