package com.ikesocial.pvas.domain.exception;

public class CursoEmUsoException extends EntidadeEmUsoException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_CURSO_EM_USO = "Curso de código %d não pode ser removida, pois está em uso";

	public CursoEmUsoException(String mensagem) {
		super(mensagem);
	}
	
	public CursoEmUsoException(Long cursoId) {
		this(String.format(MENSAGEN_CURSO_EM_USO, cursoId));
	}
	
}
