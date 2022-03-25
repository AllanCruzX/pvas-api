package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Curriculos")
public interface ExperienciaProfissionalControllerOpenApi {

	@ApiOperation("Busca uma experiência profissional por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID da experiência profissional inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Experiência profissional não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ExperienciaProfissionalModel buscar(
			@ApiParam(value = "ID de uma experiência profissional", example = "1", required = true) Long experienciaProfissionalId);

	@ApiOperation("Buscar as experiências profissionais que pertence ao curriculo")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Id do curriculo inválido", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CollectionModel<ExperienciaProfissionalModel> buscarExperienciaProfissionalsDoCurriculo(
			@ApiParam(value = "ID do curriculo", example = "1", required = true) Long curriculoId);

}