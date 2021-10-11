package com.ikesocial.pvas.api.openapi.controller;

import java.util.List;

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

	@ApiOperation("Lista as subespecialidades")
	List<SubEspecialidadeModel> listar();

	@ApiOperation("Busca uma subespecialidade por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID da subespecialidade inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Subespecialidade não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	SubEspecialidadeModel buscar(@ApiParam(value = "ID de uma subespecialidade", example = "1", required = true) Long subEspecialidadeId);

}