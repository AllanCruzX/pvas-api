package com.ikesocial.pvas.domain.chainofresponsibility.profissional;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.builder.ContatoBuilder;
import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeContatoDoProfissional extends ManipuladorDeProfissionalBase {
	
	@Autowired
	private EmailService emailService;

	@Override
	public boolean tratar(Profissional profissional) {

		emailService.validaEmailfExistente(profissional.getContatos()); 
   	    
	    Set<Contato> contatos = profissional.getContatos()
												.stream()
												.map(contato -> montaContato(contato , profissional))
												.collect(Collectors.toSet());
						
	    profissional.setContatos(contatos);

		return tratarProximo(profissional);
	}
	
	private Contato  montaContato(Contato contato, Profissional profissional) {
		
		logContato(contato, profissional);
		
		Contato contatoMontado = null;
		
		if(contato.getId() == null) {
			
			
			
			 contatoMontado = new ContatoBuilder()
						.comDescricao(contato.getDescricao())
						.comTipoContato(contato.getTipoContato())
						.comPessoa(profissional)
						.construir();
		}else {
			
			 contatoMontado = new ContatoBuilder()
					 	.comId(contato.getId())
						.comDescricao(contato.getDescricao())
						.comTipoContato(contato.getTipoContato())
						.comPessoa(profissional)
						.construir();
		}
		
		
		return contatoMontado;
												
	}

	private void logContato(Contato contato, Profissional profissional) {
		
		if(profissional.temCodigo()) {
			log.info("C=ManipuladorDeContatoDoProfissional, M=logContato, preparando contato {}, para o profissional do codigo {}", contato.getTipoContato().name() ,profissional.getCodigo());
		}else{
			log.info("C=ManipuladorDeContatoDoProfissional, M=logContato, preparando contato {}", contato.getTipoContato().name());
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.PRIMEIRO;
	}

}
