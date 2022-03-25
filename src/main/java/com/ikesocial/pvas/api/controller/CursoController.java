package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.CursoModelAssembler;
import com.ikesocial.pvas.api.model.output.CursoModel;
import com.ikesocial.pvas.api.openapi.controller.CursoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.CurriculoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.service.CursoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos/cursos", produces = MediaType.APPLICATION_JSON_VALUE)
public class CursoController implements CursoControllerOpenApi {

	@Autowired
	private CursoService cursoService;
	
	@Autowired
	private CursoModelAssembler cursoModelAssembler;

	@CheckSecurity.Cursos.PodeBuscar
	@GetMapping("/{cursoId}")
	public CursoModel buscar(@PathVariable Long cursoId) {
		log.info("C=CursoController, M=buscar, Buscando curso com o id {}",cursoId);
		
		return cursoModelAssembler.toModel(cursoService.buscarOuFalhar(cursoId));
	}
	
	@CheckSecurity.Cursos.PodeBuscarPersonalizado
	@GetMapping("/curriculo/{curriculoId}")
	public CollectionModel<CursoModel> buscarCursosDoCurriculo (@PathVariable Long curriculoId) {
		log.info("C=CursoController, M=buscarCursosDocurriculo, Buscando curso  com o id do curriculo {}",curriculoId);
		
		try {
			
			return cursoModelAssembler.toCollectionModel(cursoService.listarCursosDoCurriculo(curriculoId));
			
		} catch (CurriculoNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}

}
