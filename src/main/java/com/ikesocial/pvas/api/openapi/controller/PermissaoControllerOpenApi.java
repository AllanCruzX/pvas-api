package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.ikesocial.pvas.api.model.output.PermissaoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(tags = "Permissões")
public interface PermissaoControllerOpenApi {
	
	@ApiOperation("Listar permissoes")
	CollectionModel<PermissaoModel> listar();

}
