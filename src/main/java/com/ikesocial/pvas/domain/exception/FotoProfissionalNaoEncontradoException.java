package com.ikesocial.pvas.domain.exception;

public class FotoProfissionalNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_FOTO_PROFISSIONAL_NAO_ENCONTRADA = "Não existe um cadastro de foto do profissional com código  %s";
	
	public FotoProfissionalNaoEncontradoException(String codigo) {
		super(String.format(MENSAGEN_FOTO_PROFISSIONAL_NAO_ENCONTRADA, codigo));
	}
	
}
