package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.service.CadastroSubEspecialidadeService;

@Component
public class ManipuladorDeSubEspecialidadeAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroSubEspecialidadeService subEspecialidadeService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.getSubEspecialidades() != null && !assistenteSocial.getSubEspecialidades().isEmpty()) {

			Set<SubEspecialidade> subEspecialidades = assistenteSocial.getSubEspecialidades().stream()
					.map(subEspecialidade -> subEspecialidadeService.buscarOuFalhar(subEspecialidade.getId()))
					.collect(Collectors.toSet());

			assistenteSocial.setSubEspecialidades(subEspecialidades);

		}

		return tratarProximo(assistenteSocial);
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.NONO;
	}

}
