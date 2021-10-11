package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;

@Service
public class EmailService {
	
	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;
	
	public Optional<String> recuperaEmailEmMemoria ( Set<Contato> contatos) {
		
		return contatos.stream()
					.filter(Contato::eUmEmail)
					.map( contato -> getEmail(contato))
		    		.findFirst();
	}
	
	
	public Optional<Contato> recuperaEmailDoBancoDeDados ( Set<Contato> contatos) {
		
		return contatos.stream()
					.filter(Contato::eUmEmail)
					.map( contato -> buscarEmailBanco(contato).get())
		    		.findFirst();
	}
	
	
	public void validaEmailfExistente( Set<Contato> contatos) {
		contatos.forEach(contato -> {
			
			if(contato.eUmEmail()) {
			Optional<Contato> emaiLExistente = buscarEmailBanco(contato);

			if (emaiLExistente.isPresent() && !emaiLExistente.get().equals(contato)) {
				throw new NegocioException(String.format("Já existe um pessoa fisica cadastrado com o e-mail %s", contato.getDescricao()));
				}
			}
			
		});

	}


	private Optional<Contato> buscarEmailBanco(Contato contato) {
		return assistenteSocialRepository.buscarEmail(contato.getDescricao());
	}
	
	private String getEmail(Contato contato) {
		return contato.getDescricao();
	}


}
