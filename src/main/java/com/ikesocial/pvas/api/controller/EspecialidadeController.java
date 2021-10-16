package com.ikesocial.pvas.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.EspecialidadeModelAssembler;
import com.ikesocial.pvas.api.model.output.EspecialidadeModel;
import com.ikesocial.pvas.api.openapi.controller.EspecialidadeControllerOpenApi;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.repository.EspecialidadeRepository;
import com.ikesocial.pvas.domain.service.CadastroEspecialidadeService;

@RestController
@RequestMapping(path = "/especialidades", produces = MediaType.APPLICATION_JSON_VALUE)
public class EspecialidadeController implements EspecialidadeControllerOpenApi  {

	@Autowired
	private EspecialidadeRepository especialidadeRepository;

	@Autowired
	private CadastroEspecialidadeService cadastroEspecialidadeService;
	
	@Autowired
	private EspecialidadeModelAssembler especialidadeModelAssembler;

	@Override
	@GetMapping
	public CollectionModel<EspecialidadeModel> listar() {
		
		List<Especialidade> especialidades = especialidadeRepository.findAll();
		
		CollectionModel<EspecialidadeModel> especialidadesModel = especialidadeModelAssembler.toCollectionModel(especialidades);
		
		return especialidadesModel;
	}

	@Override
	@GetMapping("/{especialidadeId}")
	public EspecialidadeModel buscar(@PathVariable Long especialidadeId) {

		return especialidadeModelAssembler.toModel(cadastroEspecialidadeService.buscarOuFalhar(especialidadeId));
	}

}
