package com.ikesocial.pvas.domain.exception;

public class CidadeNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_CIDADE_NAO_ENCONTRADA = "Não existe um cadastro de cidade com código %d";

	public CidadeNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public CidadeNaoEncontradoException(Long cidadeId) {
		this(String.format(MENSAGEN_CIDADE_NAO_ENCONTRADA, cidadeId));
	}
	
}
