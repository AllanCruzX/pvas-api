package com.ikesocial.pvas.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.EspecialidadeModelAssembler;
import com.ikesocial.pvas.api.model.output.EspecialidadeModel;
import com.ikesocial.pvas.api.openapi.controller.EspecialidadeControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.service.EspecialidadeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos/especialidades", produces = MediaType.APPLICATION_JSON_VALUE)
public class EspecialidadeController implements EspecialidadeControllerOpenApi  {

	@Autowired
	private EspecialidadeService especialidadeService;
	
	@Autowired
	private EspecialidadeModelAssembler especialidadeModelAssembler;

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping
	public CollectionModel<EspecialidadeModel> listar() {
		log.info("C=EspecialidadeController, M=listar, Consultando especialidades");
		
		List<Especialidade> especialidades = especialidadeService.listar();
		
		CollectionModel<EspecialidadeModel> especialidadesModel = especialidadeModelAssembler.toCollectionModel(especialidades);
		
		return especialidadesModel;
	}

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{especialidadeId}")
	public EspecialidadeModel buscar(@PathVariable Long especialidadeId) {
		log.info("C=EspecialidadeController,M=buscar, Consultando especialidade de id {}" , especialidadeId);

		return especialidadeModelAssembler.toModel(especialidadeService.buscarOuFalhar(especialidadeId));
	}

}
