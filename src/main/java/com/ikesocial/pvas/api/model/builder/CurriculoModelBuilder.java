package com.ikesocial.pvas.api.model.builder;

import java.util.ArrayList;
import java.util.Set;

import org.springframework.util.CollectionUtils;

import com.ikesocial.pvas.api.model.output.CurriculoModel;
import com.ikesocial.pvas.api.model.output.CursoModel;
import com.ikesocial.pvas.api.model.output.EspecialidadeModel;
import com.ikesocial.pvas.api.model.output.EspecializacaoModel;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;
import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.api.model.output.ProfissaoModel;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.Profissao;
import com.ikesocial.pvas.domain.model.SubEspecialidade;

public class CurriculoModelBuilder {

	private CurriculoModel curriculoModel;

	public CurriculoModelBuilder() {
		this.curriculoModel = new CurriculoModel();
	}

	public CurriculoModelBuilder comId(Long id) {
		curriculoModel.setId(id);
		return this;
	}

	public CurriculoModelBuilder comIdiomas(Set<Idioma> idiomas) {

		if (!CollectionUtils.isEmpty(idiomas)) {

			curriculoModel.setIdiomas(new ArrayList<IdiomaModel>());

			montaIdiomas(idiomas);
		}

		return this;
	}

	public CurriculoModelBuilder comEspecializacoes(Set<Especializacao> especializacoes) {

		if (!CollectionUtils.isEmpty(especializacoes) ) {

			curriculoModel.setEspecializacoes(new ArrayList<EspecializacaoModel>());

			montaEspecializacao(especializacoes);

		}

		return this;
	}

	public CurriculoModelBuilder comSubEspecialidade(Set<SubEspecialidade> subEspecialidades) {

		if (!CollectionUtils.isEmpty(subEspecialidades)) {

			curriculoModel.setSubEspecialidades(new ArrayList<SubEspecialidadeModel>());
			montaSubEspecialidade(subEspecialidades);

		}

		return this;
	}

	public CurriculoModelBuilder comProfissoes(Set<Profissao> profissoes) {

		if (!CollectionUtils.isEmpty(profissoes)) {

			curriculoModel.setProfissoes(new ArrayList<ProfissaoModel>());
			montaProfissoes(profissoes);

		}

		return this;
	}

	public CurriculoModelBuilder comCursos(Set<Curso> cursos) {
		
		if (!CollectionUtils.isEmpty(cursos)) {

			curriculoModel.setCusos(new ArrayList<CursoModel>());

			montaCursos(cursos);

		}

		return this;
	}

	public CurriculoModelBuilder comExperienciasProfissionais(Set<ExperienciaProfissional> experienciasProfissionais) {

		if (!CollectionUtils.isEmpty(experienciasProfissionais)) {

			curriculoModel.setExperienciasProfissionais(new ArrayList<ExperienciaProfissionalModel>());
			montaExperienciasProfissionais(experienciasProfissionais);
		}
		return this;
	}

	private void montaExperienciasProfissionais(Set<ExperienciaProfissional> experienciasProfissionais) {
		experienciasProfissionais.forEach(experienciaProfissional -> {
			ExperienciaProfissionalModel model = new ExperienciaProfissionalModel();

			model.setId(experienciaProfissional.getId());
			model.setNomeEmpresa(experienciaProfissional.getNomeEmpresa());
			model.setAvidade(experienciaProfissional.getAvidade());
			model.setEmpresaAtual(experienciaProfissional.getEmpresaAtual());
			model.setDataInicio(experienciaProfissional.getDataInicio());
			model.setDataFim(experienciaProfissional.getDataFim());

			curriculoModel.getExperienciasProfissionais().add(model);
		});
	}

	private void montaCursos(Set<Curso> cursos) {

		cursos.forEach(curso -> {
			CursoModel model = new CursoModel();

			model.setId(curso.getId());
			model.setNome(curso.getNome());
			model.setChagaHoraria(curso.getChagaHoraria());

			curriculoModel.getCusos().add(model);
		});
	}

	private void montaProfissoes(Set<Profissao> profissoes) {
		profissoes.forEach(profissao -> {
			ProfissaoModel model = new ProfissaoModel();

			model.setId(profissao.getId());
			model.setNome(profissao.getNome());

			curriculoModel.getProfissoes().add(model);

		});
	}

	private void montaIdiomas(Set<Idioma> idiomas) {
		idiomas.forEach(idioma -> {
			IdiomaModel model = new IdiomaModel();

			model.setId(idioma.getId());
			model.setNome(idioma.getNome());

			curriculoModel.getIdiomas().add(model);

		});
	}

	private void montaSubEspecialidade(Set<SubEspecialidade> subEspecialidades) {
		subEspecialidades.forEach(subEspecialidade -> {
			SubEspecialidadeModel model = new SubEspecialidadeModel();

			model.setId(subEspecialidade.getId());
			model.setNome(subEspecialidade.getNome());
			model.setEspecialidade(new EspecialidadeModel());
			model.getEspecialidade().setId(subEspecialidade.getEspecialidade().getId());
			model.getEspecialidade().setNome(subEspecialidade.getEspecialidade().getNome());

			curriculoModel.getSubEspecialidades().add(model);

		});
	}

	private void montaEspecializacao(Set<Especializacao> especializacoes) {
		especializacoes.forEach(especializacao -> {
			EspecializacaoModel model = new EspecializacaoModel();

			model.setId(especializacao.getId());
			model.setNome(especializacao.getNome());

			curriculoModel.getEspecializacoes().add(model);

		});
	}

	public CurriculoModel construir() {
		return this.curriculoModel;
	}

}
