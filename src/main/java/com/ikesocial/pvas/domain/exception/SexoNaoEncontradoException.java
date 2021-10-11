package com.ikesocial.pvas.domain.exception;

public class SexoNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_SEXO_NAO_ENCONTRADO = "Não existe um cadastro de sexo com código %d";

	public SexoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public SexoNaoEncontradoException(Long sexoId) {
		this(String.format(MENSAGEN_SEXO_NAO_ENCONTRADO, sexoId));
	}
	
}
