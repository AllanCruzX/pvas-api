package com.ikesocial.pvas.api.openapi.controller;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.EnderecoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;


@Api(tags = "Enderecos")
public interface EnderecoControllerOpenApi {

	@ApiOperation("Busca um endereço por cep")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Cep do endereço inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Endereço não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	EnderecoModel buscar(String cep);

}