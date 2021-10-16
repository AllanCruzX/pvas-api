package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.input.ExperienciaProfissionalInput;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Experiências profissionais")
public interface ExperienciaProfissionalControllerOpenApi {

	@ApiOperation("Busca uma experiência profissional por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "ID da experiência profissional inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Experiência profissional não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ExperienciaProfissionalModel buscar(
			@ApiParam(value = "ID de uma experiência profissional", example = "1", required = true) Long experienciaProfissionalId);

	@ApiOperation("Buscar as experiências profissionais que pertence ao assistente soccial")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Código da assistente soccial inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Curso não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	CollectionModel<ExperienciaProfissionalModel> buscarExperienciaProfissionalsDaAssistenteSocial(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true) String codigoAssistenteSocial);

	@ApiOperation("Cadastra uma experiência profissional ")
	@ApiResponses({
			@ApiResponse(responseCode = "201", description = "Experiência profissiona cadastrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ExperienciaProfissionalModel adicionar(@ApiParam(name = "corpo", value = "Representação de uma nova experiência profissional", required = true)ExperienciaProfissionalInput experienciaProfissionalInput);

	@ApiOperation("Atualiza uma experiência profissional por ID")
	@ApiResponses({
		@ApiResponse(responseCode = "200", description = "Experiência profissional atualizada", content = @Content(schema = @Schema(implementation = Problem.class))),
		@ApiResponse(responseCode = "404", description = "Experiência profissional não encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ExperienciaProfissionalModel atualizar(@ApiParam(value = "ID de uma experiência profissional", example = "1", required = true)Long experienciaProfissionalId,
			 @ApiParam(name = "corpo", value = "Representação de uma experiência profissional", required = true) ExperienciaProfissionalInput experienciaProfissionalInput);

	
	@ApiOperation("Exclui uma experiência profissional por ID")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Experiência profissional excluida", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Experiência profissional não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	void remover(Long experienciaProfissionalId);

}