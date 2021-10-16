package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.EspecialidadeModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Especialidades")
public interface EspecialidadeControllerOpenApi {

	@ApiOperation("Lista as especialidades")
	CollectionModel<EspecialidadeModel> listar();

	@ApiOperation("Busca uma especialidade por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID da especialidade é inválida", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Especialidade não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	EspecialidadeModel buscar(@ApiParam(value = "ID de uma especialidade", example = "1", required = true) Long especialidadeId);

}