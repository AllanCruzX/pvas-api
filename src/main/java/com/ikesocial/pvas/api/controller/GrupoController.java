package com.ikesocial.pvas.api.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.GrupoModelAssembler;
import com.ikesocial.pvas.api.model.output.GrupoModel;
import com.ikesocial.pvas.api.openapi.controller.GrupoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.repository.GrupoRepository;
import com.ikesocial.pvas.domain.service.CadastroGrupoService;

@RestController
@RequestMapping(path = "grupos", produces = MediaType.APPLICATION_JSON_VALUE)
public class GrupoController implements GrupoControllerOpenApi  {
	
	@Autowired
	private CadastroGrupoService cadastroGrupoService;
	
	@Autowired
	private  GrupoRepository grupoRepository;
	
	@Autowired
	private GrupoModelAssembler grupoModelAssembler;
	
	
	@CheckSecurity.Grupos.PodeConsultar
	@GetMapping
	public CollectionModel<GrupoModel> listar(){
		
		return grupoModelAssembler.toCollectionModel(grupoRepository.findAll());
		
	}
	
	@CheckSecurity.Grupos.PodeConsultar
	@GetMapping("/{grupoId}")
	public GrupoModel buscar(@PathVariable Long grupoId) {
		Grupo grupo = cadastroGrupoService.buscarOuFalhar(grupoId);
		
		return grupoModelAssembler.toModel(grupo);
	}
	
	@CheckSecurity.Grupos.PodeConsultar
	@GetMapping("/assistente-social/{codigoAssistenteSocial}")
	public CollectionModel<GrupoModel> buscarGruposAssistenteSocial(@PathVariable String codigoAssistenteSocial) {
		
		Set<Grupo> grupos = null;
		
		try {
			
			 grupos = cadastroGrupoService.listarGruposDaAssistenteSocial(codigoAssistenteSocial);
			
		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}

		return grupoModelAssembler.toCollectionModel(grupos);
	}

}
