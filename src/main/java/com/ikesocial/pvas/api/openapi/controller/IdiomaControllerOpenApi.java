package com.ikesocial.pvas.api.openapi.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.model.output.IdiomaModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(tags = "Assistentes Sociais")
public interface IdiomaControllerOpenApi {
	
	@ApiOperation("Listar idiomas")
	public ResponseEntity<List<IdiomaModel>> listar();

}
