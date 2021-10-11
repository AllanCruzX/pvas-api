package com.ikesocial.pvas.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.CidadeModelAssembler;
import com.ikesocial.pvas.api.model.output.CidadeModel;
import com.ikesocial.pvas.api.openapi.controller.CidadeControllerOpenApi;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.repository.CidadeRepository;
import com.ikesocial.pvas.domain.service.CadastroCidadeService;
import com.ikesocial.pvas.domain.service.CadastroEstadoService;


@RestController
@RequestMapping(path = "/cidades", produces = MediaType.APPLICATION_JSON_VALUE)
public class CidadeController implements CidadeControllerOpenApi {

	@Autowired
	private CidadeRepository cidadeRepository;

	@Autowired
	private CadastroCidadeService cadastroCidadeService;
	
	@Autowired
	private CadastroEstadoService cadastroEstadoService;
	
	@Autowired
	private CidadeModelAssembler cidadeModelAssembler;

	@GetMapping
	public List<CidadeModel> listar() {
		
		List<Cidade> todasCidades = (List<Cidade>) cidadeRepository.findAll();
		
		return cidadeModelAssembler.toCollectionModel(todasCidades);
	}
	
	@GetMapping("/{estadoId}")
	public List<CidadeModel> listarCidadesPorEstado(@PathVariable Long estadoId) {
		
		Estado estado = cadastroEstadoService.buscarOuFalhar(estadoId);
		
		List<Cidade> todasCidades = cidadeRepository.listarCidadesPorEstado(estado.getId());
		
		return cidadeModelAssembler.toCollectionModel(todasCidades);
	}


	@GetMapping("/{cidadeId}")
	public CidadeModel buscar(@PathVariable Long cidadeId) {
		Cidade cidade = cadastroCidadeService.buscarOuFalhar(cidadeId);
		
		return cidadeModelAssembler.toModel(cidade);
	}



}
