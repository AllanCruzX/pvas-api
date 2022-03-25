package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import com.ikesocial.pvas.domain.chainofresponsibility.profissional.ManipuladorDeExperienciaProfissionalBase;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ManipuladorSemExperiencia extends ManipuladorDeExperienciaProfissionalBase {

	@Override
	public boolean tratar(ExperienciaProfissional experienciaProfissional) {
		log.info("C=ManipuladorSemExperiencia, M=tratar, verificando se tem experiencia profissional");
		
		if (experienciaProfissional.getSemExperiencia()) {
			experienciaProfissional.naoTemExperienciaProfissional();
			return true;
		}
		return tratarProximo(experienciaProfissional);
	}

}
