package com.ikesocial.pvas.domain.exception;

public class EspecialidadeNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_ESPECIALIDADE_NAO_ENCONTRADA = "Não existe um cadastro de especialidade com código %d";

	public EspecialidadeNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public EspecialidadeNaoEncontradoException(Long especialidadeId) {
		this(String.format(MENSAGEN_ESPECIALIDADE_NAO_ENCONTRADA, especialidadeId));
	}
	
}


