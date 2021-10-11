package com.ikesocial.pvas.domain.exception;

public class CidadeEmUsoException extends EntidadeEmUsoException {

	private static final long serialVersionUID = 1L;
	
	private static final String MENSAGEN_CIDADE_EM_USO = "Cidade de código %d não pode ser removida, pois está em uso";

	public CidadeEmUsoException(String mensagem) {
		super(mensagem);
	}
	
	public CidadeEmUsoException(Long cidadeId) {
		this(String.format(MENSAGEN_CIDADE_EM_USO, cidadeId));
	}
	
}
