package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.SexoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Assistentes Sociais")
public interface SexoControllerOpenApi {
	
	@ApiOperation("Lista de sexos")
	ResponseEntity<CollectionModel<SexoModel>> listarSexo();
	
	@ApiOperation("Busca um sexo por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do sexo inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Sexo não encontrado", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	SexoModel buscar(@ApiParam(value = "ID de um sexo", example = "1", required = true) Long sexoId);

}