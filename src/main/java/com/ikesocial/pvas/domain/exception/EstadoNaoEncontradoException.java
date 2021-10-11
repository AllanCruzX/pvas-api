package com.ikesocial.pvas.domain.exception;

public class EstadoNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEM_ESTADO_NAO_ENCONTRADO = "Não existe um cadastro de estado com código %d";

	public EstadoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public EstadoNaoEncontradoException(Long estadoId) {
		this(String.format(MENSAGEM_ESTADO_NAO_ENCONTRADO, estadoId));
	}
	
}
