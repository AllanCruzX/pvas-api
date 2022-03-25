package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.input.ProfissionalAlterarInput;
import com.ikesocial.pvas.api.model.input.ProfissionalInput;
import com.ikesocial.pvas.api.model.input.SenhaInput;
import com.ikesocial.pvas.api.model.output.ProfissionalModel;
import com.ikesocial.pvas.api.model.output.ProfissionalResumoModel;
import com.ikesocial.pvas.domain.filter.ProfissionalFilter;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Profissionais")
public interface ProfissionalControllerOpenApi {

	@ApiOperation("Lista de profissionais")
	PagedModel<ProfissionalResumoModel> listar(
			@ApiParam(name = "corpo", value = "Representação de filtro do profissional") ProfissionalFilter profissionalFilter,
			boolean incluirInativos, Pageable pageable);

	@ApiOperation("Buscar profissional por codigo")
	@ApiResponses({
			@ApiResponse(responseCode = "400", description = "Codigo do profissional invalido", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Profissional nao encontradao", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ProfissionalModel buscar(
			@ApiParam(value = "Codigo de um profissional", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial);

	@ApiOperation("Cadastra um profissional")
	@ApiResponses({
			@ApiResponse(responseCode = "201", description = "Profissional cadastrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ProfissionalModel adicionar(
			@ApiParam(name = "corpo", value = "Representacao de um novo profissional" , required = true) ProfissionalInput profissionalInput);

	@ApiOperation("Atualiza profissional por codigo")
	@ApiResponses({
			@ApiResponse(responseCode = "200", description = "Profissional atualizada"),
			@ApiResponse(responseCode = "404", description = "Profissional nao encontradao", content = @Content(schema = @Schema(implementation = Problem.class))) })
	ProfissionalModel atualizar(
			@ApiParam(value = "Codigo de um profissional", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial,
			@ApiParam(name = "corpo", value = "Representacao de um novo profissional" , required = true) ProfissionalAlterarInput profissionalAlterarInput);

	@ApiOperation("Ativar profissional por codigo")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Profissional Ativado"),
			@ApiResponse(responseCode = "404", description = "Profissional nao encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	 ResponseEntity<Void> ativar(
			@ApiParam(value = "Codigo de um profissional", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial);

	@ApiOperation("Inativar profissional por codigo")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Profissional Inativado"),
			@ApiResponse(responseCode = "404", description = "Profissional nao encontrado", content = @Content(schema = @Schema(implementation = Problem.class))) })
	 ResponseEntity<Void> inativar(
			@ApiParam(value = "Codigo de um profissional", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true) String codigoAssistenteSocial);
	
	@ApiOperation("Atualiza a senha de um profissional")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Senha alterada com sucesso"),
			@ApiResponse(responseCode = "404", description = "Profissional não encontradao", content = @Content(schema = @Schema(implementation = Problem.class))) })
	void alterarSenha(@ApiParam(value = "Codigo de um profissional", example = "fc60f245-6c65-4302-9025-89a9d05346a6", required = true)  String codigoAssistenteSocial,
			@ApiParam(name = "corpo", value = "Representação de um novo senha", 
			required = true) SenhaInput senha);

}