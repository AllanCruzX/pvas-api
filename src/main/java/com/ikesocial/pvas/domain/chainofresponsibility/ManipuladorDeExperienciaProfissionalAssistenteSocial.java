package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.service.CadastroExperienciaProfissionalService;

@Component
public class ManipuladorDeExperienciaProfissionalAssistenteSocial extends ManipuladorDeAssitenteSocialBase {
	
	@Autowired
	private CadastroExperienciaProfissionalService experienciaProfissionalService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if(assistenteSocial.getExperieciasProfissionais()!= null && !assistenteSocial.getExperieciasProfissionais().isEmpty()) { 
			
			Set<ExperienciaProfissional> experienciasProfissionais = assistenteSocial.getExperieciasProfissionais()
										.stream()
										.map(experiencia -> experienciaProfissionalService.buscarOuFalhar(experiencia.getId()))
										.collect(Collectors.toSet());
			
				assistenteSocial.setExperieciasProfissionais(experienciasProfissionais);
			}
		return tratarProximo(assistenteSocial);
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.TERCEIRO;
	}

}
