package com.ikesocial.pvas.domain.exception;

public class AssistenteSocialNaoEncontradoException extends EntidadeNaoEncontradaException {
	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_ASSISTENTE_SOCIAL_NAO_ENCONTRADA = "Não existe um cadastro de assistente social com código %s";

	public AssistenteSocialNaoEncontradoException(String codigo) {
		super(String.format(MENSAGEN_ASSISTENTE_SOCIAL_NAO_ENCONTRADA, codigo));
	}
	
}
