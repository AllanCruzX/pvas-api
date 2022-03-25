package com.ikesocial.pvas.domain.exception;

public class ProfissionalNaoEncontradoException extends EntidadeNaoEncontradaException {
	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_PROFISSIONAL_NAO_ENCONTRADO = "Não existe um cadastro de profissional com código %s";

	public ProfissionalNaoEncontradoException(String codigo) {
		super(String.format(MENSAGEN_PROFISSIONAL_NAO_ENCONTRADO, codigo));
	}
	
}
