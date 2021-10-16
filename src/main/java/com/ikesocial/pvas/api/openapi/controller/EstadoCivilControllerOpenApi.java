package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.EstadoCivilModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Assistentes Sociais")
public interface EstadoCivilControllerOpenApi {

	@ApiOperation("Lista de estados civis")
	ResponseEntity<CollectionModel<EstadoCivilModel>> listarEstadosCivis();

	@ApiOperation("Busca um estado civil por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID do estado civil inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Estado civil não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	EstadoCivilModel buscar(
			@ApiParam(value = "ID de um estado civil", example = "1", required = true) Long estadoCivilId);

}
