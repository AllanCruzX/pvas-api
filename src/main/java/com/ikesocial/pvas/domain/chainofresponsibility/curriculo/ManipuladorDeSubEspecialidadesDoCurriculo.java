package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.service.SubEspecialidadeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeSubEspecialidadesDoCurriculo extends ManipuladorDeCurriculoBase {

	@Autowired
	private SubEspecialidadeService subEspecialidadeService;

	@Override
	public boolean tratar(Curriculo curriculo) {

		if (curriculo.temSubEspecialidade()) {

			Set<SubEspecialidade> subEspecialidades = curriculo.getSubEspecialidades().stream()
					.map(subEspecialidade -> preparaSubEspecialidade(subEspecialidade))
					.collect(Collectors.toSet());

			curriculo.setSubEspecialidades(subEspecialidades);

		}

		return tratarProximo(curriculo);
	}

	private SubEspecialidade preparaSubEspecialidade(SubEspecialidade subEspecialidade) {
		log.info("C=ManipuladorDeSubEspecialidadesDoCurriculo, M=preparaSubEspecialidade, preparando idioma do id {}",
				subEspecialidade.getId());

		return subEspecialidadeService.buscarOuFalhar(subEspecialidade.getId());

	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SETIMO;
	}

}
