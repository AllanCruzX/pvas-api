package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.IdiomaNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.repository.IdiomaRepository;

@Service
public class CadastroIdiomaService {

	@Autowired
	private IdiomaRepository idiomaRepository;

	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;

	public Set<Idioma> listarIdiomasDaAssistenteSocial(String codigoAssistenteSocial) {

		AssistenteSocial assistenteSocialRecuperada = cadastroAssistenteSocialService
				.buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);

		Optional<AssistenteSocial> assistenteSocial = idiomaRepository
				.lirtarIdiomasDaAssistenteSocial(assistenteSocialRecuperada.getCodigo());

		return assistenteSocial.get().getIdiomas();
	}

	public Idioma buscarOuFalhar(Long idiomaId) {

		return idiomaRepository.findById(idiomaId).orElseThrow(() -> new IdiomaNaoEncontradoException(idiomaId));

	}

}
