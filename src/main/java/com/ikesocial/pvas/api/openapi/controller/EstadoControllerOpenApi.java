package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;
import org.springframework.web.context.request.ServletWebRequest;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.EstadoModel;
import com.ikesocial.pvas.api.openapi.model.EstadosModelOpenApi;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Estados")
public interface EstadoControllerOpenApi {

	@ApiOperation("Lista os estados")
	@io.swagger.annotations.ApiResponses(value = {
			@io.swagger.annotations.ApiResponse(code = 200, message = "OK", response = EstadosModelOpenApi.class) })
	ResponseEntity<CollectionModel<EstadoModel>> listar(ServletWebRequest request);

	@ApiOperation("Busca um estado por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do estado inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Estado não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	EstadoModel buscar(@ApiParam(value = "ID de um estado", example = "1", required = true) Long estadoId);

}