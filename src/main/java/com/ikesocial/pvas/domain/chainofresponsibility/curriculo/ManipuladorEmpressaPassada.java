package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import com.ikesocial.pvas.domain.chainofresponsibility.profissional.ManipuladorDeExperienciaProfissionalBase;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ManipuladorEmpressaPassada extends ManipuladorDeExperienciaProfissionalBase {

	@Override
	public boolean tratar(ExperienciaProfissional experienciaProfissional) {
		log.info("C=ManipuladorEmpressaPassada, M=tratar, verificando se e a empresa passada");

		if (experienciaProfissional.getDataFim().isBefore(experienciaProfissional.getDataInicio())) {
			throw new NegocioException("A data fim não pode acontecer antes da data início");
			
		}
		return tratarProximo(experienciaProfissional);
	}

}
