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

import com.ikesocial.pvas.api.assembler.SexoModelAssembler;
import com.ikesocial.pvas.api.model.output.SexoModel;
import com.ikesocial.pvas.api.openapi.controller.SexoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.enums.Sexo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/profissionais/sexos", produces = MediaType.APPLICATION_JSON_VALUE)
public class SexoController implements SexoControllerOpenApi  {
	
	@Autowired
	private SexoModelAssembler sexoModelAssembler;
	
	
	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<SexoModel>> listar(){
		log.info("C=SexoController,M=listar, Consultando sexos");
		
		 List<Sexo> sexos = Sexo.valores();
		 
		 CollectionModel<SexoModel> sexosModel = sexoModelAssembler.toCollectionModel(sexos);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.SECONDS).cachePublic())
					.body(sexosModel);
		
	}
	
	@CheckSecurity.Profissionais.EstaAutorizado
	@GetMapping("/{sexoId}")
	public SexoModel buscar(@PathVariable Long sexoId) {
		log.info("C=SexoController,M=buscar, buscando sexo com id{}", sexoId);
		
		Sexo sexo =  Sexo.getById(sexoId);
						
		return sexoModelAssembler.toModel(sexo);
	}

}
