package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.EspecializacaoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Especializacoes")
public interface EspecializacaoControllerOpenApi {

	@ApiOperation("Listar as especializacoes")
	ResponseEntity<CollectionModel<EspecializacaoModel>> listar();

	@ApiOperation("Busca uma especializacao por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID da especializacao é inválida", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Especializacao não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	public EspecializacaoModel buscar(
			@ApiParam(value = "ID de uma especializacao", example = "1", required = true) Long especializacaoId);

	@ApiOperation("Busca as especializacoes do assistente social")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Assistente social inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Especializacao não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CollectionModel<EspecializacaoModel> buscarEspecializacoesAssistenteSocial(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true) String codigoAssistenteSocial);

}
