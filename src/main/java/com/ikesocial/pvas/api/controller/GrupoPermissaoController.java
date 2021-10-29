package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.assembler.PermissaoModelAssembler;
import com.ikesocial.pvas.api.model.output.PermissaoModel;
import com.ikesocial.pvas.api.openapi.controller.GrupoPermissaoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.service.CadastroGrupoService;

@RestController
@RequestMapping(path = "/grupos/{grupoId}/permissoes", produces = MediaType.APPLICATION_JSON_VALUE)
public class GrupoPermissaoController implements GrupoPermissaoControllerOpenApi {

	@Autowired
	private CadastroGrupoService cadastroGrupoService;

	@Autowired
	private PermissaoModelAssembler permissaoModelAssembler;

	@Autowired
	private PvasLinks pvasLinks;

	@CheckSecurity.Grupos.PodeConsultar
	@GetMapping
	public CollectionModel<PermissaoModel> listar(@PathVariable Long grupoId) {
		Grupo grupo = cadastroGrupoService.buscarOuFalhar(grupoId);

		CollectionModel<PermissaoModel> permissoesModel = permissaoModelAssembler
				.toCollectionModel(grupo.getPermissoes())
					.removeLinks()
					.add(pvasLinks.linkToGrupoPermissoes(grupoId));

		return permissoesModel;

	}

}
