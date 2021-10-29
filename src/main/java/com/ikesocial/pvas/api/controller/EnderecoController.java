package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.HttpClientErrorException;

import com.ikesocial.pvas.api.assembler.EnderecoModelAssembler;
import com.ikesocial.pvas.api.client.ClientApiException;
import com.ikesocial.pvas.api.model.output.EnderecoModel;
import com.ikesocial.pvas.api.openapi.controller.EnderecoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.core.validation.Cep;
import com.ikesocial.pvas.domain.service.EnderecoService;

@RestController
@RequestMapping(path = "enderecos", produces = MediaType.APPLICATION_JSON_VALUE)
public class EnderecoController implements EnderecoControllerOpenApi  {
	
	@Autowired
	private EnderecoService enderecoService;
	
	@Autowired
	private EnderecoModelAssembler enderecoModelAssembler;

	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping("/{cep}")
	public EnderecoModel buscar(@PathVariable @Cep  String cep) {
		
		try {
			return enderecoModelAssembler.toModel(enderecoService.ConsultaEndereco(cep));
			
		} catch (HttpClientErrorException e) {
			throw new ClientApiException(e.getMessage());
		}
		
	}

}
