package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.GrupoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.repository.GrupoRepository;

@Service
public class CadastroGrupoService {

	@Autowired
	private GrupoRepository grupoRepository;

	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;

	public Set<Grupo> listarGruposDaAssistenteSocial(String codigoAssistenteSocial) {

		AssistenteSocial assistenteSocialRecuperada = cadastroAssistenteSocialService
				.buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);

		Optional<AssistenteSocial> assistenteSocial = grupoRepository
				.lirtarGruposDaAssistenteSocial(assistenteSocialRecuperada.getCodigo());

		return assistenteSocial.get().getGrupos();
	}

	public Grupo buscarOuFalhar(Long grupoId) {

		return grupoRepository.findById(grupoId).orElseThrow(() -> new GrupoNaoEncontradoException(grupoId));

	}

}
