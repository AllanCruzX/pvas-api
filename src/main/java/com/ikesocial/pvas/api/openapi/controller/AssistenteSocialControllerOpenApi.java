package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.input.AssistenteSocialInput;
import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.domain.filter.AssistenteSocialFilter;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Assistentes Sociais")
public interface AssistenteSocialControllerOpenApi {

	@ApiOperation("Lista de assistentes sociais")
	Page<AssistenteSocialResumoModel> listar(
			@ApiParam(name = "corpo", value = "Representação de filtro da assistente social") AssistenteSocialFilter assistenteSocialFilter,
			boolean incluirInativos, Pageable pageable);

	@ApiOperation("Buscar assistente social por código")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Código da assistente social inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	AssistenteSocialModel buscar(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial);

	@ApiOperation("Cadastra uma equipe")
	@ApiResponses({
			@ApiResponse(responseCode = "201", description = "Assistente social cadastrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	AssistenteSocialModel adicionar(
			@ApiParam(name = "corpo", value = "Representação de uma nova assistente social" , required = true) AssistenteSocialInput assistenteSocialInput);

	@ApiOperation("Atualiza assistente social por código")
	@ApiResponses({
			@ApiResponse(responseCode = "200", description = "Assistente social atualizada", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	AssistenteSocialModel atualizar(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial,
			@ApiParam(name = "corpo", value = "Representação de uma nova assistente social" , required = true) AssistenteSocialInput assistenteSocialInput);

	@ApiOperation("Ativar assistente social por código")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Assistente Ativada", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	void ativar(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial);

	@ApiOperation("Inativar assistente social por código")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Assistente Inativada", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	void inativar(
			@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true) String codigoAssistenteSocial);

}