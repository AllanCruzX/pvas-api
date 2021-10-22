package com.ikesocial.pvas.domain.chainofresponsibility;

import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

public class ManipuladorEmpresaAtual extends ManipuladorDeExperienciaProfissionalBase {

	@Override
	public boolean tratar(ExperienciaProfissional experienciaProfissional) {

		if (experienciaProfissional.getEmpresaAtual()) {
			experienciaProfissional.eEmpresaAtual();
			return true;
			
		}
		return tratarProximo(experienciaProfissional);
	}

}
