package com.ikesocial.pvas.domain.exception;

public class SubEspecialidadeNaoEncontradoException extends EntidadeNaoEncontradaException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEM_SUB_ESPECIALIDAE_NAO_ENCONTRADA = "Não existe um cadastro de sub-especialidade com código %d";

	public SubEspecialidadeNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public SubEspecialidadeNaoEncontradoException(Long subEspecialidadeId) {
		this(String.format(MENSAGEM_SUB_ESPECIALIDAE_NAO_ENCONTRADA, subEspecialidadeId));
	}
	
}
