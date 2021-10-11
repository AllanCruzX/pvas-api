package com.ikesocial.pvas.domain.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionalEventListener;

import com.ikesocial.pvas.domain.event.PessoaCadastradaEvent;
import com.ikesocial.pvas.domain.model.Pessoa;
import com.ikesocial.pvas.domain.service.EmailService;
import com.ikesocial.pvas.domain.service.EnvioEmailService;
import com.ikesocial.pvas.domain.service.EnvioEmailService.Mensagem;

@Component
public class NotificacaoPessoaCadastradaListener {

	@Autowired
	private EnvioEmailService envioEmailService;
	
	@Autowired
	private EmailService emailService;

	@TransactionalEventListener
	public void aoCadatrarPessoa(PessoaCadastradaEvent event) {
		Pessoa pessoa = event.getPessoa();

		var mensagem = Mensagem.builder()
				.assunto("Cadastro realizado com sucesso!")
				.corpo("cadastro-realizado-sucesso.html")
				.variavel("nome", pessoa.getNome())
				.destinatario(emailService.recuperaEmailEmMemoria(pessoa.getContatos()).get())
				.build();
		
		envioEmailService.enviar(mensagem);

	}

}
