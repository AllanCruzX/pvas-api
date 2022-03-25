package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.service.CurriculoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeIdiomasDoCurriculo extends ManipuladorDeCurriculoBase {
	
	@Autowired
	private CurriculoService curriculoService;

	@Override
	public boolean tratar(Curriculo curriculo) {

		if(curriculo.temIdioma()) {
			
			Set<Idioma> idiomas = curriculo.getIdiomas()
							.stream()
							.map(idioma ->preparaIdioma(idioma))
							.collect(Collectors.toSet());
			
				curriculo.setIdiomas(idiomas);
			}

		return tratarProximo(curriculo);
	}
	
	private Idioma preparaIdioma(Idioma idioma) {
		log.info("C=ManipuladorDeIdiomasDoCurriculo, M=preparaIdioma, preparando idioma do id {}", idioma.getId());
		
		return curriculoService.buscarOuFalhar(idioma.getId());
		
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUINTO;
	}

}
