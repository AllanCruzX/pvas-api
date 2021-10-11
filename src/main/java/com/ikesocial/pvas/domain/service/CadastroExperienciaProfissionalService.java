package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.repository.ExperienciaProfissionalRepository;

@Service
public class CadastroExperienciaProfissionalService {

	@Autowired
	private ExperienciaProfissionalRepository experienciaProfissionalRepository;

	public ExperienciaProfissional buscarOuFalhar(Long experienciaProfissionalId) {

		return experienciaProfissionalRepository.findById(experienciaProfissionalId)
				.orElseThrow(() -> new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId));

	}

}
