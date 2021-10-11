package com.ikesocial.pvas.domain.exception;

public class CursoNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_CURSO_NAO_ENCONTRADA = "Não existe um cadastro de curso com código %d";

	public CursoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public CursoNaoEncontradoException(Long cursoId) {
		this(String.format(MENSAGEN_CURSO_NAO_ENCONTRADA, cursoId));
	}
	
}
