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

import com.ikesocial.pvas.api.controller.CidadeController;
import com.ikesocial.pvas.api.controller.CurriculoController;
import com.ikesocial.pvas.api.controller.CursoController;
import com.ikesocial.pvas.api.controller.EnderecoController;
import com.ikesocial.pvas.api.controller.EspecialidadeController;
import com.ikesocial.pvas.api.controller.EspecializacaoController;
import com.ikesocial.pvas.api.controller.EstadoCivilController;
import com.ikesocial.pvas.api.controller.EstadoController;
import com.ikesocial.pvas.api.controller.EstatisticasController;
import com.ikesocial.pvas.api.controller.ExperienciaProfissionalController;
import com.ikesocial.pvas.api.controller.GrupoController;
import com.ikesocial.pvas.api.controller.GrupoPermissaoController;
import com.ikesocial.pvas.api.controller.IdiomaController;
import com.ikesocial.pvas.api.controller.PermissaoController;
import com.ikesocial.pvas.api.controller.ProfissaoController;
import com.ikesocial.pvas.api.controller.ProfissionalController;
import com.ikesocial.pvas.api.controller.ProfissionalFotoController;
import com.ikesocial.pvas.api.controller.SexoController;
import com.ikesocial.pvas.api.controller.SubEspecialidadeController;

@Component
public class PvasLinks {

	public static final TemplateVariables PAGINACAO_VARIABLES = new TemplateVariables(
			new TemplateVariable("page", VariableType.REQUEST_PARAM),
			new TemplateVariable("size", VariableType.REQUEST_PARAM),
			new TemplateVariable("sort", VariableType.REQUEST_PARAM));

	public Link linkToProfissionais() {
		TemplateVariables filtroVariables = new TemplateVariables(
				new TemplateVariable("codigo", VariableType.REQUEST_PARAM),
				new TemplateVariable("nome", VariableType.REQUEST_PARAM),
				new TemplateVariable("cpf", VariableType.REQUEST_PARAM),
				new TemplateVariable("email", VariableType.REQUEST_PARAM));

		String profissionaisUrl = linkTo(ProfissionalController.class).toUri().toString();

		return Link.of(UriTemplate.of(profissionaisUrl, PAGINACAO_VARIABLES.concat(filtroVariables)),
				"profissionais");
	}

	public Link linkToProfissional(String proficionalCodigo, String rel) {
		return linkTo(methodOn(ProfissionalController.class).buscar(proficionalCodigo)).withRel(rel);
	}

	public Link linkToProfissional(String proficionalCodigo) {
		return linkToProfissional(proficionalCodigo, IanaLinkRelations.SELF.value());
	}

	public Link linkToProfissionalAtivar(String proficionalCodigo, String rel) {
		return linkTo(methodOn(ProfissionalController.class).ativar(proficionalCodigo)).withRel(rel);
	}

	public Link linkToProfissionalInativar(String proficionalCodigo, String rel) {
		return linkTo(methodOn(ProfissionalController.class).inativar(proficionalCodigo)).withRel(rel);
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
		return linkTo(EstadoCivilController.class).withRel(rel);
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


	public Link linkToSubEspecialidade(Long subEspecialidadeId, String rel) {
		return linkTo(methodOn(SubEspecialidadeController.class).buscar(subEspecialidadeId)).withRel(rel);
	}

	public Link linkToSubEspecialidade(Long subEspecialidadeId) {
		return linkToSubEspecialidade(subEspecialidadeId, IanaLinkRelations.SELF.value());
	}

	public Link linkToSubEspecialidades(Long especialidadeId ,String rel) {
		return linkTo(methodOn(SubEspecialidadeController.class).listar(especialidadeId)).withRel(rel);
	}

	public Link linkToEspecialidade(Long especialidadeId, String rel) {
		return linkTo(methodOn(EspecialidadeController.class).buscar(especialidadeId)).withRel(rel);
	}

	public Link linkToEspecialidade(Long especialidadeId) {
		return linkToEspecialidade(especialidadeId, IanaLinkRelations.SELF.value());
	}

	public Link linkToEspecialidades(String rel) {
		return linkTo(EspecialidadeController.class).withRel(rel);
	}

	public Link linkToEspecialidades() {
		return linkToEspecialidades(IanaLinkRelations.SELF.value());
	}

	public Link linkToCursosDoCurriculo(Long curriculoId, String rel) {
		return linkTo(methodOn(CursoController.class).buscarCursosDoCurriculo(curriculoId))
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

	public Link linkToExperienciaProfissionalDoCurriculo(Long curriculoId, String rel) {
		return linkTo(methodOn(ExperienciaProfissionalController.class).buscarExperienciaProfissionalsDoCurriculo(curriculoId))
				.withRel(rel);
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

	public Link linkToFotoProfissionais(String codigoAssitenteSocial, String rel) {
		return linkTo(methodOn(ProfissionalFotoController.class).servirFoto(codigoAssitenteSocial,
				MediaType.APPLICATION_JSON_VALUE)).withRel(rel);
	}

	public Link linkToFotoProfissionais(String codigoAssitenteSocial) {
		return linkToFotoProfissionais(codigoAssitenteSocial, IanaLinkRelations.SELF.value());
	}

	public Link linkToGrupo(Long grupoId, String rel) {
		return linkTo(methodOn(GrupoController.class).buscar(grupoId)).withRel(rel);
	}

	public Link linkToGrupo(Long grupoId) {
		return linkToGrupo(grupoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToGrupos(String rel) {
		return linkTo(GrupoController.class).withRel(rel);
	}

	public Link linkToGrupos() {
		return linkToGrupos(IanaLinkRelations.SELF.value());
	}

//	public Link linkToGrupoProfissionais(String codigoAssitenteSocial, String rel) {
//		return linkTo(methodOn(GrupoController.class).buscarGruposProfissionais(codigoAssitenteSocial)).withRel(rel);
//	}

	public Link linkToGrupoPermissoes(Long grupoId, String rel) {
		return linkTo(methodOn(GrupoPermissaoController.class).listar(grupoId)).withRel(rel);
	}

	public Link linkToPermissoes(String rel) {
		return linkTo(PermissaoController.class).withRel(rel);
	}

	public Link linkToPermissoes() {
		return linkToPermissoes(IanaLinkRelations.SELF.value());
	}

	public Link linkToGrupoPermissoes(Long grupoId) {
		return linkToGrupoPermissoes(grupoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToEstatisticas(String rel) {
		return linkTo(EstatisticasController.class).withRel(rel);
	}

//	public Link linkToProfissionaisEstatisticas(String rel) {
//		TemplateVariables filtroVariables = new TemplateVariables(
//				new TemplateVariable("estadoId", VariableType.REQUEST_PARAM),
//				new TemplateVariable("dataCadastro", VariableType.REQUEST_PARAM),
//				new TemplateVariable("dataIntivacao", VariableType.REQUEST_PARAM),
//				new TemplateVariable("timeOffset", VariableType.REQUEST_PARAM));
//
//		String assistenteSocialEstatisticasUrl = linkTo(
//				methodOn(EstatisticasController.class).consultarProfissionaisEstatisticas(null, null)).toUri()
//						.toString();
//
//		return Link.of(UriTemplate.of(assistenteSocialEstatisticasUrl, filtroVariables), rel);
//	}
	
	
	public Link linkToEndereco(String cep, String rel) {
		return linkTo(methodOn(EnderecoController.class).buscar(cep)).withRel(rel);
	}
	
	public Link linkToCurriculo(Long curriculoId, String rel) {
		return linkTo(methodOn(CurriculoController.class).buscar(curriculoId)).withRel(rel);
	}

	public Link linkToCurriculo(Long curriculoId) {
		return linkToCurriculo(curriculoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToCurriculos(String rel) {
		return linkTo(CurriculoController.class).withRel(rel);
	}

	public Link linkToCurriculos() {
		return linkToCurriculos(IanaLinkRelations.SELF.value());
	}
	
	public Link linkToProfissao(Long profissaoId, String rel) {
		return linkTo(methodOn(ProfissaoController.class).buscar(profissaoId)).withRel(rel);
	}

	public Link linkToProfissao(Long profissaoId) {
		return linkToProfissao(profissaoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToProfissoes(String rel) {
		return linkTo(ProfissaoController.class).withRel(rel);
	}

	public Link linkToProfissoes() {
		return linkToSexos(IanaLinkRelations.SELF.value());
	}
	
	public Link linkToFotoDoProfissional(String codigoDoProfissional, String rel) {
		return linkTo(methodOn(ProfissionalFotoController.class).servirFoto(codigoDoProfissional,
				MediaType.APPLICATION_JSON_VALUE)).withRel(rel);
	}

	public Link linkToFotoDoProfissional(String codigoAssitenteSocial) {
		return linkToFotoDoProfissional(codigoAssitenteSocial, IanaLinkRelations.SELF.value());
	}

}
