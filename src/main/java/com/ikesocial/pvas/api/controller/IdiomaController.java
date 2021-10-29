package com.ikesocial.pvas.api.controller;

import java.util.List;
import java.util.Set;
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
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.repository.IdiomaRepository;
import com.ikesocial.pvas.domain.service.CadastroIdiomaService;

@RestController
@RequestMapping(path = "/assistentes-sociais/idiomas", produces = MediaType.APPLICATION_JSON_VALUE)
public class IdiomaController implements IdiomaControllerOpenApi  {
	
	@Autowired
	private CadastroIdiomaService  cadastroIdiomaService;
	
	@Autowired
	private  IdiomaRepository idiomaRepository;
	
	@Autowired
	private IdiomaModelAssembler idiomaModelAssembler;
	
	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<IdiomaModel>> listar(){
		
		List<Idioma> idiomas = (List<Idioma>) idiomaRepository.findAll();
		 
		CollectionModel<IdiomaModel> idiomasModel = idiomaModelAssembler.toCollectionModel(idiomas);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(idiomasModel);
		
	}
	
	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping("/{idiomaId}")
	public IdiomaModel buscar(@PathVariable Long idiomaId) {

		return idiomaModelAssembler.toModel(cadastroIdiomaService.buscarOuFalhar(idiomaId));
	}
	
	@CheckSecurity.AssistentesSociais.PodeConsultar
	@GetMapping("/assistente-social/{codigoAssistenteSocial}")
	public CollectionModel<IdiomaModel> buscarIdiomasDoAssistenteSocial(@PathVariable String codigoAssistenteSocial) {
		
		Set<Idioma> idiomas = null;
		
		try {
			
			 idiomas = cadastroIdiomaService.listarIdiomasDaAssistenteSocial(codigoAssistenteSocial);
			
		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}

		return idiomaModelAssembler.toCollectionModel(idiomas);
	}

}
