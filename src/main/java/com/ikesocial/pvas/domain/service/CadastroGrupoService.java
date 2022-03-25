package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.GrupoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.repository.GrupoRepository;

@Service
public class CadastroGrupoService {

	@Autowired
	private GrupoRepository grupoRepository;

	@Autowired
	private CadastroProfissionalService cadastroProfissionalService;

	public Set<Grupo> listarGruposDaAssistenteSocial(String codigoAssistenteSocial) {

		Profissional assistenteSocialRecuperada = cadastroProfissionalService
				.buscarOuFalharLazy(codigoAssistenteSocial);

		Optional<Profissional> profissional = grupoRepository
				.lirtarGruposDaAssistenteSocial(assistenteSocialRecuperada.getCodigo());

		return profissional.get().getGrupos();
	}

	public Grupo buscarOuFalhar(Long grupoId) {

		return grupoRepository.findById(grupoId).orElseThrow(() -> new GrupoNaoEncontradoException(grupoId));

	}

}
