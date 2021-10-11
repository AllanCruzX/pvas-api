package com.ikesocial.pvas.domain.exception;

public class FotoAssistenteSocialNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_FOTO_ASSITENTE_SOCIAL_NAO_ENCONTRADA = "Não existe um cadastro de foto do assistente social com código  %s";
	
	public FotoAssistenteSocialNaoEncontradoException(String codigo) {
		super(String.format(MENSAGEN_FOTO_ASSITENTE_SOCIAL_NAO_ENCONTRADA, codigo));
	}
	
}
