package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.Curriculo;

@Component
public abstract class ManipuladorDeCurriculoBase {
	
	private ManipuladorDeCurriculoBase manipuladorProximo;
	
	
	public ManipuladorDeCurriculoBase setManipuladorProximo(ManipuladorDeCurriculoBase manipulador) {
		
		this.manipuladorProximo = manipulador;
		return manipulador;
	}
	
	public abstract boolean tratar(Curriculo curriculo);
	
	public abstract Integer getPrioridade();
	
	 protected boolean tratarProximo (Curriculo curriculo) {
	        if (manipuladorProximo == null) {
	            return true;
	        }
	        return manipuladorProximo.tratar(curriculo);
	    }

}
