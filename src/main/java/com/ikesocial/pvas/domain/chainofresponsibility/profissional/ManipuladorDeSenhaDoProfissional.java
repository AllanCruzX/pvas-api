package com.ikesocial.pvas.domain.chainofresponsibility.profissional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Profissional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeSenhaDoProfissional extends ManipuladorDeProfissionalBase {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public boolean tratar(Profissional profissional) {
		log.info("C=ManipuladorDeSenhaDoProfissional, M=logSenha, preparando senha");

		if (profissional.isNovo()) {
			profissional.setSenha(passwordEncoder.encode(profissional.getSenha()));
		}

		return tratarProximo(profissional);
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUINTO;
	}

}
