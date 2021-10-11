package com.ikesocial.pvas.domain.service;

import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;

public interface DocumentoStrategy {

	public Documento definirDocumento(Documento documento, CadastroEstadoService estadoService,
			AssistenteSocialRepository assistenteSocialRepository,  PessoaFisica pessoaFisica);
}