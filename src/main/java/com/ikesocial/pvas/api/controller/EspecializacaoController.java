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

import com.ikesocial.pvas.api.assembler.EspecializacaoModelAssembler;
import com.ikesocial.pvas.api.model.output.EspecializacaoModel;
import com.ikesocial.pvas.api.openapi.controller.EspecializacaoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.repository.EspecializacaoRepository;
import com.ikesocial.pvas.domain.service.CadastroEspecializacaoService;

@RestController
@RequestMapping(path = "/especializacoes", produces = MediaType.APPLICATION_JSON_VALUE)
public class EspecializacaoController implements EspecializacaoControllerOpenApi  {

	@Autowired
	private EspecializacaoRepository especializacaoRepository;

	@Autowired
	private CadastroEspecializacaoService cadastroEspecializacaoService;
	
	@Autowired
	private EspecializacaoModelAssembler especializacaoModelAssembler;
	
	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<EspecializacaoModel>> listar(){
		 List<Especializacao> especializacoes = (List<Especializacao>) especializacaoRepository.findAll();
		 
		 CollectionModel<EspecializacaoModel> especializacoesModel = especializacaoModelAssembler.toCollectionModel(especializacoes);
		 
		 return ResponseEntity.ok()
					.cacheControl(CacheControl.maxAge(30, TimeUnit.DAYS).cachePublic())
					.body(especializacoesModel);
	}

	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping("/{especializacaoId}")
	public EspecializacaoModel buscar(@PathVariable Long especializacaoId) {

		return especializacaoModelAssembler.toModel(cadastroEspecializacaoService.buscarOuFalhar(especializacaoId));
	}
	
	@CheckSecurity.AssistentesSociais.EstaAutorizadoPersonalizado
	@GetMapping("/assistente-social/{codigoAssistenteSocial}")
	public CollectionModel<EspecializacaoModel> buscarEspecializacoesAssistenteSocial(@PathVariable String codigoAssistenteSocial) {
		
		Set<Especializacao> especializacoes = null;
		
		try {
			
			especializacoes = cadastroEspecializacaoService.lietarEspecializacoesAssistenteSocial(codigoAssistenteSocial);
			
		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}

		return especializacaoModelAssembler.toCollectionModel(especializacoes);
	}

}
