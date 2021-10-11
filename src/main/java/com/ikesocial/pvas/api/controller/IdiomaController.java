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

import com.ikesocial.pvas.api.assembler.IdiomaModelAssembler;
import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.api.openapi.controller.IdiomaControllerOpenApi;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.repository.IdiomaRepository;

@RestController
@RequestMapping(path = "/assistentes-sociais/idioma", produces = MediaType.APPLICATION_JSON_VALUE)
public class IdiomaController implements IdiomaControllerOpenApi  {
	
	@Autowired
	private  IdiomaRepository idiomaRepository;
	
	@Autowired
	private IdiomaModelAssembler idiomaModelAssembler;
	
	
	@GetMapping
	public ResponseEntity<List<IdiomaModel>> listar(){
		
		List<Idioma> idiomas = (List<Idioma>) idiomaRepository.findAll();
		 
		 List<IdiomaModel> idiomasModel = idiomaModelAssembler.toCollectionModel(idiomas);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(idiomasModel);
		
	}

}
