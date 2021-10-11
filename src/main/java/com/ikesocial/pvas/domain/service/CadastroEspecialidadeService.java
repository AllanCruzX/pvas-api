package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.EspecialidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.repository.EspecialidadeRepository;

@Service
public class CadastroEspecialidadeService {

	@Autowired
	private EspecialidadeRepository especialidadeRepository;

	@Transactional
	public Especialidade salvar(Especialidade especialidade) {

		return especialidadeRepository.save(especialidade);

	}

	public Especialidade buscarOuFalhar(Long especialidadeId) {

		return especialidadeRepository.findById(especialidadeId)
				.orElseThrow(() -> new EspecialidadeNaoEncontradoException(especialidadeId));
	}

}
