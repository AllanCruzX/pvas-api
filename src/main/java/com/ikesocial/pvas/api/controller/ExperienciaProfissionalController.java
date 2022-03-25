package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.ExperienciaProfissionalModelAssembler;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;
import com.ikesocial.pvas.api.openapi.controller.ExperienciaProfissionalControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.CurriculoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.service.ExperienciaProfissionalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos/experiencias-proficionais", produces = MediaType.APPLICATION_JSON_VALUE)
public class ExperienciaProfissionalController implements ExperienciaProfissionalControllerOpenApi {
	
	@Autowired
	private ExperienciaProfissionalService experienciaProfissionalService;

	@Autowired
	private ExperienciaProfissionalModelAssembler experienciaProfissionalModelAssembler;

	@CheckSecurity.ExperienciasProfissionais.PodeBuscar
	@GetMapping("/{experienciaProfissionalId}")
	public ExperienciaProfissionalModel buscar(@PathVariable Long experienciaProfissionalId) {
		log.info("C=ExperienciaProfissionalController, M=buscar, Buscando experiancia profissional do id {}",experienciaProfissionalId);
		
		return experienciaProfissionalModelAssembler
				.toModel(experienciaProfissionalService.buscarOuFalhar(experienciaProfissionalId));
	}

	@CheckSecurity.ExperienciasProfissionais.PodeBuscarPersonalizado
	@GetMapping("/curriculo/{curriculoId}")
	public CollectionModel<ExperienciaProfissionalModel> buscarExperienciaProfissionalsDoCurriculo(
			@PathVariable Long curriculoId) {
		log.info("C=ExperienciaProfissionalController, M=buscarExperienciaProfissionalsDoCurriculo, Buscando experiancia  com o id do curriculo {}",curriculoId);

		try {

			CollectionModel<ExperienciaProfissionalModel> experienciasProfissionaisModel = experienciaProfissionalModelAssembler
					.toCollectionModel(
							experienciaProfissionalService.listarExperienciasProfissionaisPorCurriculo(curriculoId));

			return experienciasProfissionaisModel;
		} catch (CurriculoNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}

}
