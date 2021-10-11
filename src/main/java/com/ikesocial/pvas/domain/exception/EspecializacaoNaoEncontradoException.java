package com.ikesocial.pvas.domain.exception;

public class EspecializacaoNaoEncontradoException extends EntidadeNaoEncontradaException {
	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_ESPECIALIZACAO_NAO_ENCONTRADA = "Não existe um cadastro de especialização com código %d";

	public EspecializacaoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public EspecializacaoNaoEncontradoException(Long especializacaoId) {
		this(String.format(MENSAGEN_ESPECIALIZACAO_NAO_ENCONTRADA, especializacaoId));
	}
	
}


