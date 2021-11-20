package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.service.CadastroSubEspecialidadeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeSubEspecialidadeAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroSubEspecialidadeService subEspecialidadeService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.temSubEspecialidade()) {

			Set<SubEspecialidade> subEspecialidades = assistenteSocial.getSubEspecialidades().stream()
					.map(subEspecialidade -> preparaSubEspecialidade(subEspecialidade , assistenteSocial))
					.collect(Collectors.toSet());

			assistenteSocial.setSubEspecialidades(subEspecialidades);

		}

		return tratarProximo(assistenteSocial);
	}
	
	private SubEspecialidade preparaSubEspecialidade(SubEspecialidade subEspecialidade, AssistenteSocial assistenteSocial) {
		
		SubEspecialidade subEspecialidadeBuscada = subEspecialidadeService.buscarOuFalhar(subEspecialidade.getId());
		logSubEspecialidade(subEspecialidadeBuscada, assistenteSocial);
		
		return subEspecialidadeBuscada;
	}
	
	private void logSubEspecialidade(SubEspecialidade subEspecialidade, AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.temCodigo()) {
			log.info("Preparando sub-especialidade do id {} , para o assistente social do codigo {}", subEspecialidade.getId() ,assistenteSocial.getCodigo());
		}else{
			log.info("Preparando sub-especialidade do id {}", subEspecialidade.getId());
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.NONO;
	}

}
