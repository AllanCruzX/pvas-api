package com.ikesocial.pvas.api.controller;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.EstadoCivilModelAssembler;
import com.ikesocial.pvas.api.model.output.EstadoCivilModel;
import com.ikesocial.pvas.api.openapi.controller.EstadoCivilControllerOpenApi;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;

@RestController
@RequestMapping(path = "/assistentes-sociais/estado-civil", produces = MediaType.APPLICATION_JSON_VALUE)
public class EstadoCivilController implements EstadoCivilControllerOpenApi  {
	
	@Autowired
	private EstadoCivilModelAssembler estadoCivilModelAssembler;
	
	
	@GetMapping
	public ResponseEntity<List<EstadoCivilModel>> listarEstadosCivis(){
		 List<EstadoCivil> estadosCivis = EstadoCivil.valores();
		 
		 List<EstadoCivilModel> estadosCivisModel = estadoCivilModelAssembler.toCollectionModel(estadosCivis);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(estadosCivisModel);
	}

}
