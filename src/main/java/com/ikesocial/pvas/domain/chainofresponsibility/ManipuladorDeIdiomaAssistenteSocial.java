package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.service.CadastroIdiomaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeIdiomaAssistenteSocial extends ManipuladorDeAssitenteSocialBase {
	
	@Autowired
	private CadastroIdiomaService idiomaService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if(assistenteSocial.temIdioma()) {
			
			Set<Idioma> idiomas = assistenteSocial.getIdiomas()
							.stream()
							.map(idioma ->preparaIdioma(idioma, assistenteSocial))
							.collect(Collectors.toSet());
			
				assistenteSocial.setIdiomas(idiomas);
			}

		return tratarProximo(assistenteSocial);
	}
	
	private Idioma preparaIdioma(Idioma idioma, AssistenteSocial assistenteSocial) {
		
		Idioma idiomaBuscado = idiomaService.buscarOuFalhar(idioma.getId());
		
		logIdioma(idiomaBuscado, assistenteSocial);
		
		return idiomaBuscado;
		
	}
	
	private void logIdioma(Idioma idioma, AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.temCodigo()) {
			log.info("Preparando idioma do id {} , para o assistente social do codigo {}", idioma.getId() ,assistenteSocial.getCodigo());
		}else{
			log.info("Preparando idioma do id {}", idioma.getId());
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.OITAVO;
	}

}


