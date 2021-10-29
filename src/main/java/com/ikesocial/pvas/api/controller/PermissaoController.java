package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.PermissaoModelAssembler;
import com.ikesocial.pvas.api.model.output.PermissaoModel;
import com.ikesocial.pvas.api.openapi.controller.PermissaoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.repository.PermissaoRepository;

@RestController
@RequestMapping(path = "/permissoes", produces = MediaType.APPLICATION_JSON_VALUE)
public class PermissaoController implements PermissaoControllerOpenApi {
	
	@Autowired
	private PermissaoRepository permissaoRepository;
	
	@Autowired
	private PermissaoModelAssembler permissaoModelAssembler;
	
	@CheckSecurity.Grupos.PodeConsultar
	@GetMapping
	public CollectionModel<PermissaoModel> listar() {
		
		return permissaoModelAssembler.toCollectionModel(permissaoRepository.findAll());
	}

}
