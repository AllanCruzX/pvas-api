package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.SubEspecialidadeModelAssembler;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.api.openapi.controller.SubEspecialidadeControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.service.SubEspecialidadeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "curriculos/sub-especialidades", produces = MediaType.APPLICATION_JSON_VALUE)
public class SubEspecialidadeController implements SubEspecialidadeControllerOpenApi {

	@Autowired
	private SubEspecialidadeService subEspecialidadeService;

	@Autowired
	private SubEspecialidadeModelAssembler subEspecialidadeModelAssembler;

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/especialidade/{especialidadeId}")
	public CollectionModel<SubEspecialidadeModel> listar(@PathVariable Long especialidadeId) {
		log.info("C=EspecialidadeController,M=listar, Consultando sub-especialidades pela especialidade de id {}" , especialidadeId);

		
		return subEspecialidadeModelAssembler.toCollectionModel(subEspecialidadeService.listarPorEspecialidade(especialidadeId));
	}

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{subEspecialidadeId}")
	public SubEspecialidadeModel buscar(@PathVariable Long subEspecialidadeId) {
		log.info("C=EspecialidadeController,M=buscar, Consultando sub-especialidades de id {}" , subEspecialidadeId);


		return subEspecialidadeModelAssembler
				.toModel(subEspecialidadeService.buscarOuFalhar(subEspecialidadeId));

	}

}
