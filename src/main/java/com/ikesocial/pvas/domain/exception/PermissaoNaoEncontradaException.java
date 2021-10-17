package com.ikesocial.pvas.domain.exception;

public class PermissaoNaoEncontradaException extends EntidadeNaoEncontradaException {
	private static final long serialVersionUID = 1L;
	private static final String MENSAGEN_PERMISSAO_NAO_ENCONTRADA = "Não existe um cadastro de permissão com código %d";
	

	public PermissaoNaoEncontradaException(String mensagem) {
		super(mensagem);
	}
	
	public PermissaoNaoEncontradaException(Long permissaoId) {
		this(String.format(MENSAGEN_PERMISSAO_NAO_ENCONTRADA, permissaoId));
	}
	
}