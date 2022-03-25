package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.api.openapi.model.IdiomasModelOpenApi;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Curriculos")
public interface IdiomaControllerOpenApi {
	
	@ApiOperation("Listar idiomas")
	@io.swagger.annotations.ApiResponses(value = {
			@io.swagger.annotations.ApiResponse(code = 200, message = "OK", response = IdiomasModelOpenApi.class) })
	ResponseEntity<CollectionModel<IdiomaModel>> listar();
	
	@ApiOperation("Busca um idioma por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do idioma inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Idioma não encontrada", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	IdiomaModel buscar(@ApiParam(value = "ID de um idioma", example = "1", required = true)Long idiomaId);
	
}
