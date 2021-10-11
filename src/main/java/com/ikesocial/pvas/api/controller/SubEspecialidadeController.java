package com.ikesocial.pvas.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.SubEspecialidadeModelAssembler;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.api.openapi.controller.SubEspecialidadeControllerOpenApi;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.repository.SubEspecialidadeRepository;
import com.ikesocial.pvas.domain.service.CadastroSubEspecialidadeService;

@RestController
@RequestMapping(path = "/subespecialidades", produces = MediaType.APPLICATION_JSON_VALUE)
public class SubEspecialidadeController implements SubEspecialidadeControllerOpenApi {

	@Autowired
	private SubEspecialidadeRepository subEspecialidadeRepository;

	@Autowired
	private CadastroSubEspecialidadeService cadastroSubEspecialidadeService;

	@Autowired
	private SubEspecialidadeModelAssembler subEspecialidadeModelAssembler;

	@Override
	@GetMapping
	public List<SubEspecialidadeModel> listar() {

		List<SubEspecialidade> subespecialidades = (List<SubEspecialidade>) subEspecialidadeRepository.findAll();

		return subEspecialidadeModelAssembler.toCollectionModel(subespecialidades);
	}

	@Override
	@GetMapping("/{subEspecialidadeId}")
	public SubEspecialidadeModel buscar(@PathVariable Long subEspecialidadeId) {

		return subEspecialidadeModelAssembler
				.toModel(cadastroSubEspecialidadeService.buscarOuFalhar(subEspecialidadeId));

	}

}
