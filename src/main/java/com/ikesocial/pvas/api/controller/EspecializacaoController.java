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

import com.ikesocial.pvas.api.assembler.EspecializacaoModelAssembler;
import com.ikesocial.pvas.api.model.output.EspecializacaoModel;
import com.ikesocial.pvas.api.openapi.controller.EspecializacaoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.service.EspecializacaoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos/especializacoes", produces = MediaType.APPLICATION_JSON_VALUE)
public class EspecializacaoController implements EspecializacaoControllerOpenApi  {

	@Autowired
	private EspecializacaoService especializacaoService;
	
	@Autowired
	private EspecializacaoModelAssembler especializacaoModelAssembler;
	
	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<EspecializacaoModel>> listar(){
		log.info("C=EspecializacaoController, M=listar, buscando especializacoes ");
		
		 List<Especializacao> especializacoes = especializacaoService.listar();
		 
		 CollectionModel<EspecializacaoModel> especializacoesModel = especializacaoModelAssembler.toCollectionModel(especializacoes);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(especializacoesModel);
	}

	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{especializacaoId}")
	public EspecializacaoModel buscar(@PathVariable Long especializacaoId) {
		log.info("C=EspecializacaoController, M=buscar, buscando especializacao de id {}", especializacaoId);

		return especializacaoModelAssembler.toModel(especializacaoService.buscarOuFalhar(especializacaoId));
	}

}
