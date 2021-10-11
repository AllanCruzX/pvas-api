package com.ikesocial.pvas.domain.event;

import com.ikesocial.pvas.domain.model.Pessoa;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class PessoaCadastradaEvent {
	
	private Pessoa pessoa;

}
