package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.IdiomaModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Assistentes Sociais")
public interface IdiomaControllerOpenApi {
	
	@ApiOperation("Listar idiomas")
	ResponseEntity<CollectionModel<IdiomaModel>> listar();
	
	@ApiOperation("Busca um idioma por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do idioma inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Idioma não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	IdiomaModel buscar(@ApiParam(value = "ID de um idioma", example = "1", required = true)Long idiomaId);
	
	
	@ApiOperation("Busca os idiomas do assistente social")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "Código do assistente social inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Idioma  não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	CollectionModel<IdiomaModel> buscarIdiomasDoAssistenteSocial(@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial);

}
