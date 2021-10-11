package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.CidadeModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags =  "Cidades")
public interface CidadeControllerOpenApi {

	@ApiOperation("Lista as cidades")
	CollectionModel<CidadeModel> listar();

	
	@ApiOperation("Lista as cidades por estado ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do estado inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Estado não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	CollectionModel<CidadeModel> listarCidadesPorEstado(@ApiParam(value = "ID de um estado", example = "1", required = true) Long estadoId);
	
	
	@ApiOperation("Busca uma cidade por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID da cidade inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Cidade não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	CidadeModel buscar(@ApiParam(value = "ID de uma cidade", example = "1", required = true) Long cidadeId);

}