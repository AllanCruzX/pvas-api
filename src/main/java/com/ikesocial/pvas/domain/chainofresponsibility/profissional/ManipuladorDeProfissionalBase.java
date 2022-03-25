package com.ikesocial.pvas.domain.chainofresponsibility.profissional;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.Profissional;

@Component
public abstract class ManipuladorDeProfissionalBase {
	
	private ManipuladorDeProfissionalBase manipuladorProximo;
	
	
	public ManipuladorDeProfissionalBase setManipuladorProximo(ManipuladorDeProfissionalBase manipulador) {
		
		this.manipuladorProximo = manipulador;
		return manipulador;
	}
	
	public abstract boolean tratar(Profissional profissional);
	
	public abstract Integer getPrioridade();
	
	 protected boolean tratarProximo (Profissional profissional) {
	        if (manipuladorProximo == null) {
	            return true;
	        }
	        return manipuladorProximo.tratar(profissional);
	    }

}
