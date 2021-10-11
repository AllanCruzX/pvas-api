package com.ikesocial.pvas.domain.exception;

public class EstadoCivilEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_ESTADO_CIVIL_NAO_ENCONTRADO = "Não existe um cadastro de estado civil com código %d";

	public EstadoCivilEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public EstadoCivilEncontradoException(Long estadoCivilId) {
		this(String.format(MENSAGEN_ESTADO_CIVIL_NAO_ENCONTRADO, estadoCivilId));
	}
	
}
