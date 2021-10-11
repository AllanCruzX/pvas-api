package com.ikesocial.pvas.domain.service;


import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.SubEspecialidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.repository.SubEspecialidadeRepository;

@Service
public class CadastroSubEspecialidadeService {

	@Autowired
	private SubEspecialidadeRepository subEspecialidadeRepository;

	@Autowired
	private CadastroEspecialidadeService cadastroEspecialidadeService;

	@Transactional
	public SubEspecialidade salvar(SubEspecialidade subEspecialidade) {

		Long especialidadeId = subEspecialidade.getEspecialidade().getId();

		Especialidade especialidade = cadastroEspecialidadeService.buscarOuFalhar(especialidadeId);

		subEspecialidade.setEspecialidade(especialidade);

		return subEspecialidadeRepository.save(subEspecialidade);

	}

	@Transactional
	public void excluir(Long subEspecialidadeId) {
		try {
			subEspecialidadeRepository.deleteById(subEspecialidadeId);

		} catch (EmptyResultDataAccessException e) {
			throw new SubEspecialidadeNaoEncontradoException(subEspecialidadeId);

		}
	}

	public SubEspecialidade buscarOuFalhar(Long subEspecialidadeId) {

		return subEspecialidadeRepository.findById(subEspecialidadeId)
				.orElseThrow(() -> new SubEspecialidadeNaoEncontradoException(subEspecialidadeId));

	}

}
