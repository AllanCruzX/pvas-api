package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.CursoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Curriculos")
public interface CursoControllerOpenApi {

	@ApiOperation("Busca um curso por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID do curso inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Curso não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CursoModel buscar(@ApiParam(value = "ID de um curso", example = "1", required = true) Long cursoId);

	@ApiOperation("Busca os curso que pertence ao curriculo")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID do curriculo inválido", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CollectionModel<CursoModel> buscarCursosDoCurriculo(
			@ApiParam(value = "ID do curriculo", example = "1", required = true) Long curriculoId);

}