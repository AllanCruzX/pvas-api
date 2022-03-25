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

import com.ikesocial.pvas.api.assembler.IdiomaModelAssembler;
import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.api.openapi.controller.IdiomaControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.service.IdiomaService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos/idiomas", produces = MediaType.APPLICATION_JSON_VALUE)
public class IdiomaController implements IdiomaControllerOpenApi  {
	
	@Autowired
	private IdiomaService idiomaService;
	
	@Autowired
	private IdiomaModelAssembler idiomaModelAssembler;
	
	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<IdiomaModel>> listar(){
		log.info("C=IdiomaController,M=listar, Consultando idiomas");
		
		List<Idioma> idiomas = idiomaService.listar();
		 
		CollectionModel<IdiomaModel> idiomasModel = idiomaModelAssembler.toCollectionModel(idiomas);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(idiomasModel);
		
	}
	
	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{idiomaId}")
	public IdiomaModel buscar(@PathVariable Long idiomaId) {
		log.info("C=IdiomaController,M=buscar, buscando idioma de id {}", idiomaId);
		
		return idiomaModelAssembler.toModel(idiomaService.buscarOuFalhar(idiomaId));
	}

}
