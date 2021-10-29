package com.ikesocial.pvas.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.RepresentationModel;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.core.security.PvasSecurity;

import springfox.documentation.annotations.ApiIgnore;

@ApiIgnore
@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class RootEntryPointController {

	@Autowired
	private PvasLinks pvasLinks;

	@Autowired
	private PvasSecurity pvasSecurity;

	@GetMapping
	public RootEntryPointModel root() {
		var rootEntryPointModel = new RootEntryPointModel();

		if (pvasSecurity.podeConsultarAssistentesSociais()) {
			rootEntryPointModel.add(pvasLinks.linkToAssistentesSociais());
		}
		rootEntryPointModel.add(pvasLinks.linkToSubEspecialidades("sub-especialidades"));
		rootEntryPointModel.add(pvasLinks.linkToEspecialidades("especialidades"));
		rootEntryPointModel.add(pvasLinks.linkToEspecializacoes("especializacoes"));
		rootEntryPointModel.add(pvasLinks.linkToIdiomas("idiomas"));
		rootEntryPointModel.add(pvasLinks.linkToEstadoCivis("estados-civis"));
		rootEntryPointModel.add(pvasLinks.linkToSexos("sexos"));
		rootEntryPointModel.add(pvasLinks.linkToCursos("cursos"));
		rootEntryPointModel.add(pvasLinks.linkToExperienciasProfissionais("experiencias-profissionais"));
		rootEntryPointModel.add(pvasLinks.linkToEstados("estados"));
		rootEntryPointModel.add(pvasLinks.linkToCidades("cidades"));
		if (pvasSecurity.podeConsultarGruposPermissoes()) {
			rootEntryPointModel.add(pvasLinks.linkToGrupos("grupos"));
			rootEntryPointModel.add(pvasLinks.linkToPermissoes("permissoes"));
		}
		if (pvasSecurity.podeConsultarRelatorios()) {
			rootEntryPointModel.add(pvasLinks.linkToAssistenteSocialEstatisticas("estatisticas"));
		}
		rootEntryPointModel.add(pvasLinks.linkToEndereco(null, "endereco"));

		return rootEntryPointModel;
	}

	private static class RootEntryPointModel extends RepresentationModel<RootEntryPointModel> {
	}

}