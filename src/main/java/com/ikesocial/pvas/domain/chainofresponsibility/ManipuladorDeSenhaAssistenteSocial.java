package com.ikesocial.pvas.domain.chainofresponsibility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public class ManipuladorDeSenhaAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.isNovo()) {
			assistenteSocial.setSenha(passwordEncoder.encode(assistenteSocial.getSenha()));
		}

		return tratarProximo(assistenteSocial);
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.DECIMO;
	}

}
