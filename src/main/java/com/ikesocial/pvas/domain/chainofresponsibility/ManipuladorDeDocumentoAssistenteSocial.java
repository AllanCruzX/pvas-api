package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.builder.ContatoBuilder;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.service.EmailService;

@Component
public class ManipuladorDeDocumentoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {
	
	@Autowired
	private EmailService emailService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		emailService.validaEmailfExistente(assistenteSocial.getContatos()); 
   	    
	    Set<Contato> contatos = assistenteSocial.getContatos()
												.stream()
												.map(contato -> montaContato(contato , assistenteSocial))
												.collect(Collectors.toSet());
						
	    assistenteSocial.setContatos(contatos);

		return tratarProximo(assistenteSocial);
	}
	
	private Contato  montaContato(Contato contato, AssistenteSocial assistenteSocial) {
		
		Contato contatoMontado = new ContatoBuilder()
											.comDescricao(contato.getDescricao())
											.comTipoContato(contato.getTipoContato())
											.comPessoaFisica(assistenteSocial)
											.construir();
		return contatoMontado;
												
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.PRIMEIRO;
	}

}
