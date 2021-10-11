package com.ikesocial.pvas.domain.exception;

public class ExperienciaProfissionalNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;

	private static final String MENSAGEN_EXPERIENCIA_PROFISSIONAL_NAO_ENCONTRADA = "Não existe um cadastro de experiência profissional  com código %d";

	public ExperienciaProfissionalNaoEncontradoException(String mensagem) {
		super(mensagem);
	}

	public ExperienciaProfissionalNaoEncontradoException(Long experienciaProfissionalId) {
		this(String.format(MENSAGEN_EXPERIENCIA_PROFISSIONAL_NAO_ENCONTRADA, experienciaProfissionalId));
	}

}
