package com.ikesocial.pvas.api.openapi.controller;

import java.io.IOException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.multipart.MultipartFile;

import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.input.FotoDoProfissionalInput;
import com.ikesocial.pvas.api.model.output.FotoAssistenteSocialModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

@Api(tags = "Profissionais")
public interface ProfissionalFotoControllerOpenApi {

	@ApiOperation("Atualiza a foto do assistente social")
	@ApiResponses({
			@ApiResponse(responseCode = "200", description = "Foto do assistente social atualizada", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Foto do assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	FotoAssistenteSocialModel atualizarFoto(@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true) String codigoAssistenteSocial,
			
			FotoDoProfissionalInput fotoDoProfissionalInput,
			@ApiParam(value = "Arquivo da foto do produto (máximo 500KB, apenas JPG e PNG)",
			required = true)
			MultipartFile arquivo
			
			) throws IOException;
	

	   @ApiOperation(value = "\"Busca a foto do assistente social", produces = "image/jpeg, image/png, application/json")
	    @ApiResponses({
	            @ApiResponse(responseCode = "200",description = "OK", content = @Content(schema = @Schema(implementation = FotoAssistenteSocialModel.class), mediaType = "application/json")),
	            @ApiResponse(responseCode = "200",description = "OK", content = @Content(mediaType = "image/png")),
	            @ApiResponse(responseCode = "200",description = "OK", content = @Content(mediaType = "image/jpeg")),
	            @ApiResponse(responseCode = "400",description = "Código do restaurante ou produto inválido", content = @Content(schema = @Schema(implementation = Problem.class))),
	            @ApiResponse(responseCode = "404",description = "Foto do assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class)))
	    })
	ResponseEntity<?> servirFoto(@ApiParam(value = "Código de uma assistente social", example = "fc60f245-6c65-4302-9025-89a9d05346a6" , required = true)String codigoAssistenteSocial, @ApiParam(hidden = true, required = false) String acceptHeader)
			throws HttpMediaTypeNotAcceptableException;

	@ApiOperation("Exclui uma foto do assistente social")
	@ApiResponses({
			@ApiResponse(responseCode = "204", description = "Foto do assistente social excluida", content = @Content(schema = @Schema(implementation = Problem.class))),
			@ApiResponse(responseCode = "404", description = "Foto do assistente social não encontrada", content = @Content(schema = @Schema(implementation = Problem.class))) })
	void excluir(String codigoAssistenteSocial);

}