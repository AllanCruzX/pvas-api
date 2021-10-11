package com.ikesocial.pvas.api.openapi.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.model.output.EstadoCivilModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(tags = "Assistentes Sociais")
public interface EstadoCivilControllerOpenApi {
	
	@ApiOperation("Lista de estados civis")
	ResponseEntity<List<EstadoCivilModel>> listarEstadosCivis();

}
