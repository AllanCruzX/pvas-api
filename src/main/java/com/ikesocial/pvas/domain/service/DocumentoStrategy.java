package com.ikesocial.pvas.domain.service;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Documento;

@Component
public interface DocumentoStrategy {

	public Documento definirDocumento(Documento documento, AssistenteSocial assistenteSocial);
}