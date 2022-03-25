package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.service.CadastroProfissionalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeProfissionalDoCurriculo extends ManipuladorDeCurriculoBase {

	@Autowired
	private CadastroProfissionalService profissionalService;

	@Override
	public boolean tratar(Curriculo curriculo) {

		preparaProfissional(curriculo);
		
		return tratarProximo(curriculo);
	}

	private Curriculo preparaProfissional(Curriculo curriculo) {
		log.info("C=ManipuladorDeProfissionalDoCurriculo, M=preparaProfissional, preparando curso");
		
		Profissional profissional = profissionalService.buscarOuFalharLazy(curriculo.getProfissional().getCodigo());

		if (!curriculo.isNovo()) {
			profissionalService.existeProfissionalParaOCurriculo(curriculo.getId(), profissional.getCodigo());
		} else {
			profissional.setCurriculo(curriculo);
			
		}
		curriculo.setProfissional(profissional);

		return curriculo;
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.PRIMEIRO;
	}

}
