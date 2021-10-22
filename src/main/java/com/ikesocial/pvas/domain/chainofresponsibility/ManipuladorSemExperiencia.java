package com.ikesocial.pvas.domain.chainofresponsibility;

import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

public class ManipuladorSemExperiencia extends ManipuladorDeExperienciaProfissionalBase {

	@Override
	public boolean tratar(ExperienciaProfissional experienciaProfissional) {

		if (experienciaProfissional.getSemExperiencia()) {
			experienciaProfissional.naoTemExperienciaProfissional();
			return true;
		}
		return tratarProximo(experienciaProfissional);
	}

}
