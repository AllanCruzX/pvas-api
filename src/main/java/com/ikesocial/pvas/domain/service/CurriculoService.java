package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.IdiomaNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

@Service
public class CurriculoService {

	@Autowired
	private CurriculoRepository curriculoRepository;

	public Idioma buscarOuFalhar(Long idiomaId) {

		return curriculoRepository.buscarIdiomaPorId(idiomaId)
				.orElseThrow(() -> new IdiomaNaoEncontradoException(idiomaId));

	}

}
