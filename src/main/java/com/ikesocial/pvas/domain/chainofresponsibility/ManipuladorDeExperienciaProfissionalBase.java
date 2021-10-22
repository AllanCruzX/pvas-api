package com.ikesocial.pvas.domain.chainofresponsibility;

import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

public abstract class ManipuladorDeExperienciaProfissionalBase {
	
	private ManipuladorDeExperienciaProfissionalBase manipuladorProximo;
	
	
	public ManipuladorDeExperienciaProfissionalBase setManipuladorProximo(ManipuladorDeExperienciaProfissionalBase manipulador) {
		
		this.manipuladorProximo = manipulador;
		return manipulador;
	}
	
	public abstract boolean tratar(ExperienciaProfissional experienciaProfissional);
	
	 protected boolean tratarProximo (ExperienciaProfissional experienciaProfissional) {
	        if (manipuladorProximo == null) {
	            return true;
	        }
	        return manipuladorProximo.tratar(experienciaProfissional);
	    }
	

}
