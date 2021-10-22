package com.ikesocial.pvas.domain.chainofresponsibility;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public abstract class ManipuladorDeAssitenteSocialBase {
	
	private ManipuladorDeAssitenteSocialBase manipuladorProximo;
	
	
	public ManipuladorDeAssitenteSocialBase setManipuladorProximo(ManipuladorDeAssitenteSocialBase manipulador) {
		
		this.manipuladorProximo = manipulador;
		return manipulador;
	}
	
	public abstract boolean tratar(AssistenteSocial assistenteSocial);
	
	public abstract Integer getPrioridade();
	
	 protected boolean tratarProximo (AssistenteSocial assistenteSocial) {
	        if (manipuladorProximo == null) {
	            return true;
	        }
	        return manipuladorProximo.tratar(assistenteSocial);
	    }

}
