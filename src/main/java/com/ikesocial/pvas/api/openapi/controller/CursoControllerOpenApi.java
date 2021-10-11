package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.input.CursoInput;
import com.ikesocial.pvas.api.model.output.CursoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Cursos")
public interface CursoControllerOpenApi {

	@ApiOperation("Busca um curso por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID do curso inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Curso não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CursoModel buscar(@ApiParam(value = "ID de um curso", example = "1") Long cursoId);

	@ApiOperation("Busca um curso pelo código da assistente soccial")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Código da assistente soccial inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Curso não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CollectionModel<CursoModel> buscarCursosDaPessoaFisica(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true) String codigoAssistenteSocial);

	@ApiOperation("Cadastra um curso")
	@ApiResponses({
			@ApiResponse(responseCode = "201", description = "Curso cadastrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CursoModel adicionar(@ApiParam(name = "corpo", value = "Representação de uma novo curso", required = true) CursoInput cursoInput);

	@ApiOperation("Atualiza um curso por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "200", description = "Curso atualizado", content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Curso não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CursoModel atualizar(@ApiParam(value = "ID de um curso", example = "1", required = true) Long cursoId, @ApiParam(name = "corpo", value = "Representação de um curso", required = true) CursoInput cursoInput);

	@ApiOperation("Exclui um curso por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Curso excluido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Curso não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	void remover(@ApiParam(value = "ID de um curso", example = "1", required = true) Long cursoId);

}