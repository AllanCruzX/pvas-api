package com.ikesocial.pvas.domain.exception;

public class ProfissaoNaoEncontradaException extends EntidadeNaoEncontradaException {
	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_PROFISSAO_NAO_ENCONTRADO = "Nao existe uma profissao com codigo %s";

	public ProfissaoNaoEncontradaException(Long codigo) {
		super(String.format(MENSAGEN_PROFISSAO_NAO_ENCONTRADO, codigo));
		
	}
	
}
