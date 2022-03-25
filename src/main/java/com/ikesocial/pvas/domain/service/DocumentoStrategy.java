package com.ikesocial.pvas.domain.service;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.Documento;

@Component
public interface DocumentoStrategy {

	public Documento definirDocumento(Documento documento, Profissional profissional);
}