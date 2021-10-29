package com.ikesocial.pvas.api.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.ResourceUriHelper;
import com.ikesocial.pvas.api.assembler.CursoModelAssembler;
import com.ikesocial.pvas.api.assembler.disassembler.CursoInputDisassembler;
import com.ikesocial.pvas.api.model.input.CursoInput;
import com.ikesocial.pvas.api.model.output.CursoModel;
import com.ikesocial.pvas.api.openapi.controller.CursoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.repository.CursoRepository;
import com.ikesocial.pvas.domain.service.CadastroAssistenteSocialService;
import com.ikesocial.pvas.domain.service.CadastroCursoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/cursos", produces = MediaType.APPLICATION_JSON_VALUE)
public class CursoController implements CursoControllerOpenApi {

	@Autowired
	private CursoRepository cursoRepository;

	@Autowired
	private CadastroCursoService cadastroCursoService;
	
	@Autowired
	private CursoModelAssembler cursoModelAssembler;
	
	@Autowired
	private CursoInputDisassembler cursoInputDisassembler;
	
	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;


	@CheckSecurity.Cursos.PodeBuscar
	@GetMapping("/{cursoId}")
	public CursoModel buscar(@PathVariable Long cursoId) {
		log.info("Buscando curso pelo id {}", cursoId);
		
		return cursoModelAssembler.toModel(cadastroCursoService.buscarOuFalhar(cursoId));
	}
	
	@CheckSecurity.Cursos.PodeBuscarPersonalizado
	@GetMapping("/assitente-social/{codigoAssistenteSocial}")
	public CollectionModel<CursoModel> buscarCursosAssistenteSocial (@PathVariable String codigoAssistenteSocial) {
		
		log.info("Buscando curso da assistente social do codigo {}", codigoAssistenteSocial);
		
		try {
			cadastroAssistenteSocialService.buscarOuFalhar(codigoAssistenteSocial);
			return cursoModelAssembler.toCollectionModel(cursoRepository.lirtarCursosAssistenteSocial(codigoAssistenteSocial));
		} catch (AssistenteSocialNaoEncontradoException e) {
			
			throw new NegocioException(e.getMessage(), e);
		}
	}
	
	@CheckSecurity.Cursos.PodeCadastrar
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public CursoModel adicionar(@RequestBody @Valid CursoInput cursoInput) {
		
		
		try {
			
			Curso curso = cursoInputDisassembler.toDomainObject(cursoInput);
			curso = cadastroCursoService.salvar(curso);
			log.info("Criando curso de id {}", curso.getId());
			
			CursoModel cursoModel = cursoModelAssembler.toModel(curso);
			
			ResourceUriHelper.addUriInResponseHeader(cursoModel.getId());
			
			return cursoModel;
		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
		
	}
	
	@CheckSecurity.Cursos.PodeEditar
	@PutMapping("/{cursoId}")
	public CursoModel atualizar(@PathVariable Long cursoId, @RequestBody @Valid CursoInput cursoInput) {
		log.info("Atualizando curso de id {}", cursoId);
		try {
			
			Curso cursoAtual = cadastroCursoService.buscarOuFalhar(cursoId);
			
			cursoInputDisassembler.copyToDomainObject(cursoInput, cursoAtual);
			
			cursoAtual = cadastroCursoService.salvar(cursoAtual);
			return cursoModelAssembler.toModel(cursoAtual);
			
		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}
	
	@CheckSecurity.Cursos.PodeExcluir
	@DeleteMapping("/{cursoId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long cursoId) {
		log.info("Removendo curso de id {}", cursoId);
		
		cadastroCursoService.excluir(cursoId);
	}

}
