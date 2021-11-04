package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.service.CadastroExperienciaProfissionalService;

@Component
public class ManipuladorDeExperienciaProfissionalAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroExperienciaProfissionalService experienciaProfissionalService;
	
	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.getExperieciasProfissionais() != null
				&& !assistenteSocial.getExperieciasProfissionais().isEmpty()) {

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

		if (!StringUtils.hasText(assistenteSocial.getCodigo())) {
			experienciaProfissionalRecuperado = montaExperienciaProfissional(experienciaProfissional, assistenteSocial,
					null);
		} else {
			experienciaProfissionalRecuperado = montaExperienciaProfissional(experienciaProfissional, assistenteSocial,
					assistenteSocial.getCodigo());
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
