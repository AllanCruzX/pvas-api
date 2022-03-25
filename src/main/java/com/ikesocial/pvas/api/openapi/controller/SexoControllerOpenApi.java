package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.SexoModel;
import com.ikesocial.pvas.api.openapi.model.SexosModelOpenApi;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Profissionais")
public interface SexoControllerOpenApi {
	
	@ApiOperation("Lista de sexos")
	@io.swagger.annotations.ApiResponses(value = {
			@io.swagger.annotations.ApiResponse(code = 200, message = "OK", response = SexosModelOpenApi.class) })
	ResponseEntity<CollectionModel<SexoModel>> listar();
	
	@ApiOperation("Busca um sexo por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do sexo inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Sexo não encontrado", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	SexoModel buscar(@ApiParam(value = "ID de um sexo", example = "1", required = true) Long sexoId);

}
