package com.ikesocial.pvas.domain.exception;

public class IdiomaNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_IDIOMA_NAO_ENCONTRADA = "Não existe um cadastro de idioma com código %d";

	public IdiomaNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public IdiomaNaoEncontradoException(Long idiomaId) {
		this(String.format(MENSAGEN_IDIOMA_NAO_ENCONTRADA, idiomaId));
	}
	
}
