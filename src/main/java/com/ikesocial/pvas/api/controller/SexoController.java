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

import com.ikesocial.pvas.api.assembler.SexoModelAssembler;
import com.ikesocial.pvas.api.model.output.SexoModel;
import com.ikesocial.pvas.api.openapi.controller.SexoControllerOpenApi;
import com.ikesocial.pvas.domain.model.enums.Sexo;

@RestController
@RequestMapping(path = "/assistentes-sociais/sexo", produces = MediaType.APPLICATION_JSON_VALUE)
public class SexoController implements SexoControllerOpenApi  {
	
	@Autowired
	private SexoModelAssembler sexoModelAssembler;
	
	
	@GetMapping("/sexo")
	public ResponseEntity<List<SexoModel>> listarSexo(){
		 List<Sexo> sexos = Sexo.valores();
		 
		 List<SexoModel> sexosModel = sexoModelAssembler.toCollectionModel(sexos);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(sexosModel);
		
	}

}
