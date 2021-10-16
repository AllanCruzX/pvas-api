package com.ikesocial.pvas.domain.exception;

public class ExperienciaProfissionalEmUsoException  extends EntidadeEmUsoException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_CURSO_EM_USO = "Experiência profissional de código %d não pode ser removida, pois está em uso";

	public ExperienciaProfissionalEmUsoException(String mensagem) {
		super(mensagem);
	}
	
	public ExperienciaProfissionalEmUsoException(Long experienciaProfissionalId) {
		this(String.format(MENSAGEN_CURSO_EM_USO, experienciaProfissionalId));
	}

}
