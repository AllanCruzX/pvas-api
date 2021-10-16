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

@Api(tags = "SubEspecialidades")
public interface SubEspecialidadeControllerOpenApi {

	@ApiOperation("Lista as sub-especialidades")
	CollectionModel<SubEspecialidadeModel> listar();

	@ApiOperation("Busca uma sub-especialidade por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID da subespecialidade inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Subespecialidade não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	SubEspecialidadeModel buscar(@ApiParam(value = "ID de uma subespecialidade", example = "1", required = true) Long subEspecialidadeId);
	
	
	@ApiOperation("Busca sub-especialidades do assistente social")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "Assistente social inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Subespecialidade não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	CollectionModel<SubEspecialidadeModel> buscarSubEspecialidadeAssistenteSocial(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial);

}