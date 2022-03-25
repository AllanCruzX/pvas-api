package com.ikesocial.pvas.api.openapi.controller;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.input.CurriculoAlterarInput;
import com.ikesocial.pvas.api.model.input.CurriculoInput;
import com.ikesocial.pvas.api.model.output.CurriculoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags =  "Curriculos")
public interface CurriculoControllerOpenApi {
	
	@ApiOperation("Busca um curriculo por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "400", description = "ID do curriculo inválido", 
				content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Curriculo não encontrado", 
				content = @Content(schema = @Schema(implementation = Problem.class)))
		})
	CurriculoModel buscar(@ApiParam(value = "ID de um curriculo", example = "1", required = true) Long curriculoId);
	
	
	@ApiOperation("Cadastra um curriculo")
	@ApiResponses({
			@ApiResponse(responseCode = "201", description = "Curriculo cadastrado", 
					content = @Content(schema = @Schema(implementation = Problem.class))) })
	CurriculoModel adicionar(@ApiParam(name = "corpo", value = "Representação de um novo curriculo", required = true) CurriculoInput curriculoInput);
	

	@ApiOperation("Atualiza um curriculo por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "200", description = "Curriculo atualizado", content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Curriculo não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CurriculoModel atualizar(@ApiParam(value = "ID de um curriculo", example = "1", required = true) Long curriculoId, 
			@ApiParam(name = "corpo", value = "Representação de um curriculo", required = true) CurriculoAlterarInput curriculoAlterarInput);

}