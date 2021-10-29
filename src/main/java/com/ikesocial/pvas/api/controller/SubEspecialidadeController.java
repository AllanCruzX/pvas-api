package com.ikesocial.pvas.api.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.SubEspecialidadeModelAssembler;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.api.openapi.controller.SubEspecialidadeControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.repository.SubEspecialidadeRepository;
import com.ikesocial.pvas.domain.service.CadastroSubEspecialidadeService;

@RestController
@RequestMapping(path = "/sub-especialidades", produces = MediaType.APPLICATION_JSON_VALUE)
public class SubEspecialidadeController implements SubEspecialidadeControllerOpenApi {

	@Autowired
	private SubEspecialidadeRepository subEspecialidadeRepository;

	@Autowired
	private CadastroSubEspecialidadeService cadastroSubEspecialidadeService;

	@Autowired
	private SubEspecialidadeModelAssembler subEspecialidadeModelAssembler;

	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping
	public CollectionModel<SubEspecialidadeModel> listar() {
		return subEspecialidadeModelAssembler.toCollectionModel(subEspecialidadeRepository.findAll());
	}

	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping("/{subEspecialidadeId}")
	public SubEspecialidadeModel buscar(@PathVariable Long subEspecialidadeId) {

		return subEspecialidadeModelAssembler
				.toModel(cadastroSubEspecialidadeService.buscarOuFalhar(subEspecialidadeId));

	}

	@CheckSecurity.AssistentesSociais.EstaAutorizadoPersonalizado
	@GetMapping("/assistente-social/{codigoAssistenteSocial}")
	public CollectionModel<SubEspecialidadeModel> buscarSubEspecialidadeAssistenteSocial(
			@PathVariable String codigoAssistenteSocial) {

		Set<SubEspecialidade> subEspecialidades = null;

		try {

			subEspecialidades = cadastroSubEspecialidadeService
					.listarSubEspecialidadeAssistenteSocial(codigoAssistenteSocial);

		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}

		return subEspecialidadeModelAssembler.toCollectionModel(subEspecialidades);
	}

}
