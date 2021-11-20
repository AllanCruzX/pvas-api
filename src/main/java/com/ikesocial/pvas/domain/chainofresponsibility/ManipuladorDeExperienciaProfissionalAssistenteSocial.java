package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.service.CadastroExperienciaProfissionalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeExperienciaProfissionalAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroExperienciaProfissionalService experienciaProfissionalService;
	
	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.temExperienciaProfissional()) {

			Set<ExperienciaProfissional> experienciasProfissionais = assistenteSocial.getExperieciasProfissionais()
																							.stream()
																							.map(e -> preparaExperienciaProfissional(e, assistenteSocial))
																							.collect(Collectors.toSet());

			assistenteSocial.setExperieciasProfissionais(experienciasProfissionais);
		}
		return tratarProximo(assistenteSocial);
	}

	private ExperienciaProfissional preparaExperienciaProfissional(ExperienciaProfissional experienciaProfissional,
			AssistenteSocial assistenteSocial) {
		ExperienciaProfissional experienciaProfissionalRecuperado = null;
		
		if (!assistenteSocial.temCodigo()) {
			
			experienciaProfissionalRecuperado = montaExperienciaProfissional(experienciaProfissional, assistenteSocial,	null);
			log.info("Preparando experiencia profissional do id {} ", experienciaProfissional.getId());
			
		} else {
			
			experienciaProfissionalRecuperado = montaExperienciaProfissional(experienciaProfissional, assistenteSocial,	assistenteSocial.getCodigo());
			log.info("Preparando experiencia profissional do id {} , para o assistente social do codigo {}", experienciaProfissional.getId() ,assistenteSocial.getCodigo());
		}

		return experienciaProfissionalRecuperado;
	}

	
	private ExperienciaProfissional montaExperienciaProfissional(ExperienciaProfissional experienciaProfissional,
			AssistenteSocial assistenteSocial, String codigoAssitenteSocial) {
		
		ExperienciaProfissional experienciaProfissionalRecuperado = experienciaProfissionalService
				.buscarOuFalharExperienciaProfissionalDisponivel(experienciaProfissional.getId(), codigoAssitenteSocial);
		
//		if(experienciaProfissionalRecuperado.getAssistenteSocial() == null) {
//		experienciaProfissionalRecuperado.setAssistenteSocial(assistenteSocial);
//		}

		return experienciaProfissionalRecuperado;
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.TERCEIRO;
	}

}
