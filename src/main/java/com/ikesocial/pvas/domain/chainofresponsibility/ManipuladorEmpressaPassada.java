package com.ikesocial.pvas.domain.chainofresponsibility;

import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

public class ManipuladorEmpressaPassada extends ManipuladorDeExperienciaProfissionalBase {

	@Override
	public boolean tratar(ExperienciaProfissional experienciaProfissional) {

		if (experienciaProfissional.getDataFim().isBefore(experienciaProfissional.getDataInicio())) {
			throw new NegocioException("A data fim não pode acontecer antes da data início");
			
		}
		return tratarProximo(experienciaProfissional);
	}

}
