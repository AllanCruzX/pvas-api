package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.service.ExperienciaProfissionalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeExperienciaProfissionalDoCurriculo extends ManipuladorDeCurriculoBase {

	@Autowired
	private ExperienciaProfissionalService experienciaProfissionalService;

	@Override
	public boolean tratar(Curriculo curriculo) {

		if (curriculo.temExperienciaProfissional()) {

			Set<ExperienciaProfissional> experienciasProfissionais = curriculo.getExperieciasProfissionais().stream()
					.map(e -> preparaExperienciaProfissional(e, curriculo)).collect(Collectors.toSet());

			curriculo.setExperieciasProfissionais(experienciasProfissionais);
		}

		return tratarProximo(curriculo);
	}

	private ExperienciaProfissional preparaExperienciaProfissional(ExperienciaProfissional experienciaProfissional,
			Curriculo curriculo) {
		log.info(
				"C=ManipuladorDeExperienciaProfissionalDoCurriculo, M=preparaExperienciaProfissional, preparando experiencia Profissional");

		if (!curriculo.isNovo() && !experienciaProfissional.isNovo()) {
			experienciaProfissionalService.existeExperienciaProfissionalParaOCurriculo(curriculo.getId(),
					experienciaProfissional.getId());
		}

		manipulaExperienciaProfissional();

		if (!experienciaProfissional.isNovo()) {
			ExperienciaProfissional experienciaProfissionalBuscada = experienciaProfissionalService
					.buscarOuFalhar(experienciaProfissional.getId());
			
			experienciaProfissional.setDataCadastro(experienciaProfissionalBuscada.getDataCadastro());
		}

		experienciaProfissional.setCurriculo(curriculo);

		return experienciaProfissional;
	}

	private void manipulaExperienciaProfissional() {
		log.info(
				"C=ManipuladorDeExperienciaProfissionalDoCurriculo, M=manipulaExperienciaProfissional, preparando experiencia Profissional");

		ManipuladorSemExperiencia manipulador = new ManipuladorSemExperiencia();
		manipulador.setManipuladorProximo(new ManipuladorEmpresaAtual())
				.setManipuladorProximo(new ManipuladorEmpressaPassada());
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUARTO;
	}

}
