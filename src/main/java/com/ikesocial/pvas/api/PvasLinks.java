package com.ikesocial.pvas.api;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import org.springframework.hateoas.IanaLinkRelations;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.TemplateVariable;
import org.springframework.hateoas.TemplateVariable.VariableType;
import org.springframework.hateoas.TemplateVariables;
import org.springframework.hateoas.UriTemplate;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.controller.AssistenteSocialController;
import com.ikesocial.pvas.api.controller.AssistenteSocialFotoController;
import com.ikesocial.pvas.api.controller.CidadeController;
import com.ikesocial.pvas.api.controller.CursoController;
import com.ikesocial.pvas.api.controller.EspecialidadeController;
import com.ikesocial.pvas.api.controller.EspecializacaoController;
import com.ikesocial.pvas.api.controller.EstadoCivilController;
import com.ikesocial.pvas.api.controller.EstadoController;
import com.ikesocial.pvas.api.controller.ExperienciaProfissionalController;
import com.ikesocial.pvas.api.controller.IdiomaController;
import com.ikesocial.pvas.api.controller.SexoController;
import com.ikesocial.pvas.api.controller.SubEspecialidadeController;

@Component
public class PvasLinks {

	public static final TemplateVariables PAGINACAO_VARIABLES = new TemplateVariables(
			new TemplateVariable("page", VariableType.REQUEST_PARAM),
			new TemplateVariable("size", VariableType.REQUEST_PARAM),
			new TemplateVariable("sort", VariableType.REQUEST_PARAM));

	public Link linkToAssistentesSociais() {
		TemplateVariables filtroVariables = new TemplateVariables(
				new TemplateVariable("codigo", VariableType.REQUEST_PARAM),
				new TemplateVariable("nome", VariableType.REQUEST_PARAM),
				new TemplateVariable("cpf", VariableType.REQUEST_PARAM),
				new TemplateVariable("email", VariableType.REQUEST_PARAM));

		String assistentesSociaisUrl = linkTo(AssistenteSocialController.class).toUri().toString();

		return Link.of(UriTemplate.of(assistentesSociaisUrl, PAGINACAO_VARIABLES.concat(filtroVariables)),
				"assistentes-sociais");
	}

	public Link linkToAssistenteSocial(String assistenteSocialCodigo, String rel) {
		return linkTo(methodOn(AssistenteSocialController.class).buscar(assistenteSocialCodigo)).withRel(rel);
	}

	public Link linkToAssistenteSocial(String assistenteSocialCodigo) {
		return linkToAssistenteSocial(assistenteSocialCodigo, IanaLinkRelations.SELF.value());
	}

	public Link linkToAssistenteSocialAtivar(String assistenteSocialCodigo, String rel) {
		return linkTo(methodOn(AssistenteSocialController.class).ativar(assistenteSocialCodigo)).withRel(rel);
	}

	public Link linkToAssistenteSocialInativar(String assistenteSocialCodigo, String rel) {
		return linkTo(methodOn(AssistenteSocialController.class).inativar(assistenteSocialCodigo)).withRel(rel);
	}

	public Link linkToSexo(Long sexoId, String rel) {
		return linkTo(methodOn(SexoController.class).buscar(sexoId)).withRel(rel);
	}

	public Link linkToSexo(Long sexoId) {
		return linkToSexo(sexoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToSexos(String rel) {
		return linkTo(SexoController.class).withRel(rel);
	}

	public Link linkToSexos() {
		return linkToSexos(IanaLinkRelations.SELF.value());
	}

	public Link linkToEstadoCivil(Long estadoCivilId, String rel) {
		return linkTo(methodOn(EstadoCivilController.class).buscar(estadoCivilId)).withRel(rel);
	}

	public Link linkToEstadoCivil(Long estadoCivilId) {
		return linkToEstadoCivil(estadoCivilId, IanaLinkRelations.SELF.value());
	}

	public Link linkToEstadoCivis(String rel) {
		return linkTo(SexoController.class).withRel(rel);
	}

	public Link linkToEstadoCivis() {
		return linkToEstadoCivis(IanaLinkRelations.SELF.value());
	}

	public Link linkToIdioma(Long idiomaId, String rel) {
		return linkTo(methodOn(IdiomaController.class).buscar(idiomaId)).withRel(rel);
	}

	public Link linkToIdioma(Long idiomaId) {
		return linkToIdioma(idiomaId, IanaLinkRelations.SELF.value());
	}

	public Link linkToIdiomas(String rel) {
		return linkTo(IdiomaController.class).withRel(rel);
	}

	public Link linkToIdiomas() {
		return linkToIdiomas(IanaLinkRelations.SELF.value());
	}

	public Link linkToIdiomasDoAssistenteSocial(String assistenteSocialCodigo, String rel) {
		return linkTo(methodOn(IdiomaController.class).buscarIdiomasDoAssistenteSocial(assistenteSocialCodigo))
				.withRel(rel);
	}

	public Link linkToEspecializacao(Long especializacaoId, String rel) {
		return linkTo(methodOn(EspecializacaoController.class).buscar(especializacaoId)).withRel(rel);
	}

	public Link linkToEspecializacao(Long especializacaoId) {
		return linkToEspecializacao(especializacaoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToEspecializacoes(String rel) {
		return linkTo(EspecializacaoController.class).withRel(rel);
	}

	public Link linkToEspecializacoes() {
		return linkToEspecializacoes(IanaLinkRelations.SELF.value());
	}

	public Link linkToEspecializacoesAssistenteSocial(String assistenteSocialCodigo, String rel) {
		return linkTo(
				methodOn(EspecializacaoController.class).buscarEspecializacoesAssistenteSocial(assistenteSocialCodigo))
						.withRel(rel);
	}

	public Link linkToSubEspecialidade(Long subEspecialidadeId, String rel) {
		return linkTo(methodOn(SubEspecialidadeController.class).buscar(subEspecialidadeId)).withRel(rel);
	}

	public Link linkToSubEspecialidade(Long subEspecialidadeId) {
		return linkToSubEspecialidade(subEspecialidadeId, IanaLinkRelations.SELF.value());
	}

	public Link linkToSubEspecialidades(String rel) {
		return linkTo(SubEspecialidadeController.class).withRel(rel);
	}

	public Link linkToSubEspecialidades() {
		return linkToSubEspecialidades(IanaLinkRelations.SELF.value());
	}

	public Link linkToSubEspecialidadesAssistenteSocial(String codigoAssistenteSocial, String rel) {
		return linkTo(methodOn(SubEspecialidadeController.class)
				.buscarSubEspecialidadeAssistenteSocial(codigoAssistenteSocial)).withRel(rel);
	}

	public Link linkToEspecialidade(Long especialidadeId, String rel) {
		return linkTo(methodOn(EspecialidadeController.class).buscar(especialidadeId)).withRel(rel);
	}

	public Link linkToEspecialidade(Long especialidadeId) {
		return linkToSubEspecialidade(especialidadeId, IanaLinkRelations.SELF.value());
	}

	public Link linkToEspecialidades(String rel) {
		return linkTo(EspecialidadeController.class).withRel(rel);
	}

	public Link linkToEspecialidades() {
		return linkToEspecialidades(IanaLinkRelations.SELF.value());
	}

	public Link linkToCursosAssistenteSocial(String codigoAssistenteSocial, String rel) {
		return linkTo(methodOn(CursoController.class).buscarCursosAssistenteSocial(codigoAssistenteSocial))
				.withRel(rel);
	}

	public Link linkToCurso(Long cursoId) {
		return linkToCurso(cursoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToCursos(String rel) {
		return linkTo(CursoController.class).withRel(rel);
	}

	public Link linkToCursos() {
		return linkToCursos(IanaLinkRelations.SELF.value());
	}

	public Link linkToCurso(Long cursoId, String rel) {
		return linkTo(methodOn(CursoController.class).buscar(cursoId)).withRel(rel);
	}

	public Link linkToExperienciaProfissional(Long ExperienciaProfissionalId, String rel) {
		return linkTo(methodOn(ExperienciaProfissionalController.class).buscar(ExperienciaProfissionalId)).withRel(rel);
	}

	public Link linkToExperienciaProfissional(Long ExperienciaProfissionalId) {
		return linkToExperienciaProfissional(ExperienciaProfissionalId, IanaLinkRelations.SELF.value());
	}

	public Link linkToExperienciasProfissionais(String rel) {
		return linkTo(ExperienciaProfissionalController.class).withRel(rel);
	}

	public Link linkToExperienciasProfissionais() {
		return linkToExperienciasProfissionais(IanaLinkRelations.SELF.value());
	}

	public Link linkToExperienciaProfissionalDaAssistenteSocial(String codigoAssitenteSocial, String rel) {
		return linkTo(methodOn(ExperienciaProfissionalController.class)
				.buscarExperienciaProfissionalsDaAssistenteSocial(codigoAssitenteSocial)).withRel(rel);
	}

	public Link linkToCidade(Long cidadeId, String rel) {
		return linkTo(methodOn(CidadeController.class).buscar(cidadeId)).withRel(rel);
	}

	public Link linkToCidade(Long cidadeId) {
		return linkToCidade(cidadeId, IanaLinkRelations.SELF.value());
	}

	public Link linkToCidades(String rel) {
		return linkTo(CidadeController.class).withRel(rel);
	}

	public Link linkToCidades() {
		return linkToCidades(IanaLinkRelations.SELF.value());
	}

	public Link linkToEstado(Long estadoId, String rel) {
		return linkTo(methodOn(EstadoController.class).buscar(estadoId)).withRel(rel);
	}

	public Link linkToEstado(Long estadoId) {
		return linkToEstado(estadoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToEstados(String rel) {
		return linkTo(EstadoController.class).withRel(rel);
	}

	public Link linkToEstados() {
		return linkToEstados(IanaLinkRelations.SELF.value());
	}

	public Link linkToFotoAssistenteSocial(String codigoAssitenteSocial, String rel) {
		return linkTo(methodOn(AssistenteSocialFotoController.class).servirFoto(codigoAssitenteSocial,
				MediaType.APPLICATION_JSON_VALUE)).withRel(rel);
	}

	public Link linkToFotoAssistenteSocial(String codigoAssitenteSocial) {
		return linkToFotoAssistenteSocial(codigoAssitenteSocial, IanaLinkRelations.SELF.value());
	}

}
