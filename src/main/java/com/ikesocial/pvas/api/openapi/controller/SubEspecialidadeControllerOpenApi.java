package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Curriculos")
public interface SubEspecialidadeControllerOpenApi {

	@ApiOperation("Lista as sub-especialidades por ID da especialidade ")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID da especialidade inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		})
	CollectionModel<SubEspecialidadeModel> listar(@ApiParam(value = "ID de uma especialidade", example = "1", required = true) Long especialidadeId);

	
	@ApiOperation("Busca uma sub-especialidade por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID da subespecialidade inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Subespecialidade não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	SubEspecialidadeModel buscar(@ApiParam(value = "ID de uma subespecialidade", example = "1", required = true) Long subEspecialidadeId);
	

}