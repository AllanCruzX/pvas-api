package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.GrupoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Grupos")
public interface GrupoControllerOpenApi {

	@ApiOperation("Listar grupos")
	CollectionModel<GrupoModel> listar();

	@ApiOperation("Busca um grupo por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID do grupo inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Grupo não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	GrupoModel buscar(@ApiParam(value = "ID de um grupo", example = "1", required = true) Long grupoId);

	@ApiOperation("Busca os idiomas do assistente social")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Código do assistente social inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Grupo  não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CollectionModel<GrupoModel> buscarGruposAssistenteSocial(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true) String codigoAssistenteSocial);

}
