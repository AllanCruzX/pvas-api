package com.ikesocial.pvas.domain.exception;

public class GrupoNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_GRUPO_NAO_ENCONTRADA = "Não existe um cadastro de grupo com código %d";

	public GrupoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public GrupoNaoEncontradoException(Long grupoId) {
		this(String.format(MENSAGEN_GRUPO_NAO_ENCONTRADA, grupoId));
	}
	
}
