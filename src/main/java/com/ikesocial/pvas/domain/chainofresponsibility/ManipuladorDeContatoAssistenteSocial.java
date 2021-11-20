package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.builder.ContatoBuilder;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeContatoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {
	
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
		
		logContato(contato, assistenteSocial);
		
		Contato contatoMontado = null;
		
		if(contato.getId() == null) {
			
			
			
			 contatoMontado = new ContatoBuilder()
						.comDescricao(contato.getDescricao())
						.comTipoContato(contato.getTipoContato())
						.comPessoa(assistenteSocial)
						.construir();
		}else {
			
			 contatoMontado = new ContatoBuilder()
					 	.comId(contato.getId())
						.comDescricao(contato.getDescricao())
						.comTipoContato(contato.getTipoContato())
						.comPessoa(assistenteSocial)
						.construir();
		}
		
		
		return contatoMontado;
												
	}

	private void logContato(Contato contato, AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.temCodigo()) {
			log.info("Preparando contato {}, para o assistente social do codigo {}", contato.getTipoContato().name() ,assistenteSocial.getCodigo());
		}else{
			log.info("Preparando contato {}", contato.getTipoContato().name());
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.PRIMEIRO;
	}

}
