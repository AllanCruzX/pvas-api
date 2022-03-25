package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import com.ikesocial.pvas.domain.chainofresponsibility.profissional.ManipuladorDeExperienciaProfissionalBase;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ManipuladorEmpresaAtual extends ManipuladorDeExperienciaProfissionalBase {

	@Override
	public boolean tratar(ExperienciaProfissional experienciaProfissional) {
		log.info("C=ManipuladorEmpresaAtual, M=tratar, verificando se e a empresa atual");

		if (experienciaProfissional.getEmpresaAtual()) {
			experienciaProfissional.eEmpresaAtual();
			return true;
			
		}
		return tratarProximo(experienciaProfissional);
	}

}
