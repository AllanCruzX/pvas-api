package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.IdiomaNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.repository.IdiomaRepository;

@Service
public class CadastroIdiomaService {

	@Autowired
	private IdiomaRepository idiomaRepository;

	public Idioma buscarOuFalhar(Long idiomaId) {

		return idiomaRepository.findById(idiomaId).orElseThrow(() -> new IdiomaNaoEncontradoException(idiomaId));

	}

}
