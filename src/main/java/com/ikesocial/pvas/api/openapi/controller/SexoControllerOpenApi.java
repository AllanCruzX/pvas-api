package com.ikesocial.pvas.api.openapi.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.model.output.SexoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(tags = "Assistentes Sociais")
public interface SexoControllerOpenApi {
	
	@ApiOperation("Lista de sexos")
	ResponseEntity<List<SexoModel>> listarSexo();

}
