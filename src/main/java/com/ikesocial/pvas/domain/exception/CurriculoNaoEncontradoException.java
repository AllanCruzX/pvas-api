package com.ikesocial.pvas.domain.exception;

public class CurriculoNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_CURSO_NAO_ENCONTRADA = "Nao existe um cadastro de curriculo com codigo %d";

	public CurriculoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public CurriculoNaoEncontradoException(Long cursoId) {
		this(String.format(MENSAGEN_CURSO_NAO_ENCONTRADA, cursoId));
	}
	
}
