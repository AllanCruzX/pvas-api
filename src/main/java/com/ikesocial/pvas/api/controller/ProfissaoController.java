package com.ikesocial.pvas.api.controller;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.CacheControl;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.ProfissaoModelAssembler;
import com.ikesocial.pvas.api.model.output.ProfissaoModel;
import com.ikesocial.pvas.api.openapi.controller.ProfissaoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.model.Profissao;
import com.ikesocial.pvas.domain.service.ProfissaoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos/profissoes", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProfissaoController implements ProfissaoControllerOpenApi  {

	@Autowired
	private ProfissaoService profissaoService;
	
	@Autowired
	private ProfissaoModelAssembler profissaoModelAssembler;
	
	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<ProfissaoModel>> listar(){
		log.info("C=ProfissaoController,M=listar, Consultando profissoes");
		
		 List<Profissao> profissoes = profissaoService.listar();
		 
		 CollectionModel<ProfissaoModel> profissoesModel = profissaoModelAssembler.toCollectionModel(profissoes);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(profissoesModel);
	}

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{profissaoId}")
	public ProfissaoModel buscar(@PathVariable Long profissaoId) {
		log.info("C=ProfissaoController,M=buscar, Consultando profissao de id {}" , profissaoId);
		
		return profissaoModelAssembler.toModel(profissaoService.buscarOuFalhar(profissaoId));
	}

}
