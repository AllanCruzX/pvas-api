package com.ikesocial.pvas.api.controller;

import java.util.List;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.CacheControl;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.EstadoCivilModelAssembler;
import com.ikesocial.pvas.api.model.output.EstadoCivilModel;
import com.ikesocial.pvas.api.openapi.controller.EstadoCivilControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/profissionais/estados-civis", produces = MediaType.APPLICATION_JSON_VALUE)
public class EstadoCivilController implements EstadoCivilControllerOpenApi {

	@Autowired
	private EstadoCivilModelAssembler estadoCivilModelAssembler;

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<EstadoCivilModel>> listar() {
		log.info("C=EstadoCivilController,M=listar, Consultando estados civis");

		List<EstadoCivil> estadosCivis = EstadoCivil.valores();

		CollectionModel<EstadoCivilModel> estadosCivisModel = estadoCivilModelAssembler.toCollectionModel(estadosCivis);

		return ResponseEntity.ok()
				.cacheControl(CacheControl
								.maxAge(30, TimeUnit.SECONDS)
								.cachePublic())
				.body(estadosCivisModel);
	}

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{estadoCivilId}")
	public EstadoCivilModel buscar(@PathVariable Long estadoCivilId) {
		log.info("C=EstadoCivilController,M=buscar, buscando estado civil com id{}", estadoCivilId);
		
		EstadoCivil estadoCivil = EstadoCivil.getById(estadoCivilId);

		return estadoCivilModelAssembler.toModel(estadoCivil);
	}

}
