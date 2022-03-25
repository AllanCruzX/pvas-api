package com.ikesocial.pvas.core.modelmapper.converter;

import java.util.HashSet;
import java.util.Set;

import com.ikesocial.pvas.api.model.input.CursoAlterarInput;
import com.ikesocial.pvas.api.model.input.CursoInput;
import com.ikesocial.pvas.api.model.input.EspecializacaoIdInput;
import com.ikesocial.pvas.api.model.input.ExperienciaProfissionalAlterarInput;
import com.ikesocial.pvas.api.model.input.ExperienciaProfissionalInput;
import com.ikesocial.pvas.api.model.input.IdiomaIdInput;
import com.ikesocial.pvas.api.model.input.ProfissaoIdInput;
import com.ikesocial.pvas.api.model.input.SubEspecialidadeIdInput;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.Profissao;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.SubEspecialidade;

public class CurriculoInputEmCurriculoBuilder {

	private Curriculo curriculo;

	public CurriculoInputEmCurriculoBuilder() {
		curriculo = new Curriculo();
	}
	
	
	public CurriculoInputEmCurriculoBuilder comProffisional(String profissionalCodigo) {
		curriculo.setProfissional(new Profissional());
		curriculo.getProfissional().setCodigo(profissionalCodigo);
		return this;
	}

	public CurriculoInputEmCurriculoBuilder comId(Long id) {
		curriculo.setId(id);
		return this;
	}

	public CurriculoInputEmCurriculoBuilder comIdiomas(Set<IdiomaIdInput> idiomas) {

		if (!idiomas.isEmpty()) {

			curriculo.setIdiomas(new HashSet<Idioma>());

			idiomas.forEach(i -> {
				Idioma idioma = new Idioma();
				idioma.setId(i.getId());

				curriculo.getIdiomas().add(idioma);
			});

		}

		return this;

	}

	public CurriculoInputEmCurriculoBuilder comEspecializacao(Set<EspecializacaoIdInput> especializacoes) {

		if (!especializacoes.isEmpty()) {

			curriculo.setEspecializacoes(new HashSet<Especializacao>());

			especializacoes.forEach(e -> {
				Especializacao especializacao = new Especializacao();
				especializacao.setId(e.getId());

				curriculo.getEspecializacoes().add(especializacao);
			});

		}

		return this;

	}

	public CurriculoInputEmCurriculoBuilder comSubEspecialidade(Set<SubEspecialidadeIdInput> subEspecialidades) {

		if (!subEspecialidades.isEmpty()) {

			curriculo.setSubEspecialidades(new HashSet<SubEspecialidade>());

			subEspecialidades.forEach(s -> {
				SubEspecialidade subEspecialidade = new SubEspecialidade();
				subEspecialidade.setId(s.getId());

				curriculo.getSubEspecialidades().add(subEspecialidade);

			});

		}

		return this;

	}

	public CurriculoInputEmCurriculoBuilder comProfissao(Set<ProfissaoIdInput> profissoes) {

		curriculo.setProfissoes(new HashSet<Profissao>());

		profissoes.forEach(p -> {
			Profissao profissao = new Profissao();
			profissao.setId(p.getId());

			curriculo.getProfissoes().add(profissao);

		});

		return this;

	}

	public CurriculoInputEmCurriculoBuilder comCurso(Set<CursoInput> cursos) {

		if (!cursos.isEmpty()) {

			curriculo.setCursos(new HashSet<Curso>());

			cursos.forEach(c -> {

				Curso curso = new Curso();
				curso.setNome(c.getNome());
				curso.setChagaHoraria(Long.valueOf(c.getChagaHoraria()));

				curriculo.getCursos().add(curso);

			});

		}
		return this;
	}

	public CurriculoInputEmCurriculoBuilder comCursos(Set<CursoAlterarInput> cursos) {

		if (!cursos.isEmpty()) {

			curriculo.setCursos(new HashSet<Curso>());

			cursos.forEach(c -> {

				preparaCurso(c);

			});

		}
		return this;
	}

	private void preparaCurso(CursoAlterarInput c) {
		Curso curso = new Curso();

		if (c.getId() != null) {
			curso.setId(c.getId());

		}

		curso.setNome(c.getNome());
		curso.setChagaHoraria(Long.valueOf(c.getChagaHoraria()));
		curriculo.getCursos().add(curso);
	}

	public CurriculoInputEmCurriculoBuilder comExperienciaProfissional(
			Set<ExperienciaProfissionalInput> experienciasProfissionais) {

		if (!experienciasProfissionais.isEmpty()) {
			curriculo.setExperieciasProfissionais(new HashSet<ExperienciaProfissional>());

			experienciasProfissionais.forEach(e -> {
				ExperienciaProfissional experienciaProfissional = new ExperienciaProfissional();

				experienciaProfissional.setNomeEmpresa(e.getNomeEmpresa());
				experienciaProfissional.setAvidade(e.getAvidade());
				experienciaProfissional.setDataInicio(e.getDataInicio());
				experienciaProfissional.setDataFim(e.getDataFim());
				experienciaProfissional.setEmpresaAtual(e.getEmpresaAtual());
				experienciaProfissional.setSemExperiencia(e.getSemExperiencia());

				curriculo.getExperieciasProfissionais().add(experienciaProfissional);

			});
		}
		return this;
	}

	public CurriculoInputEmCurriculoBuilder comExperienciaProfissionais(
			Set<ExperienciaProfissionalAlterarInput> experienciasProfissionais) {

		if (!experienciasProfissionais.isEmpty()) {
			curriculo.setExperieciasProfissionais(new HashSet<ExperienciaProfissional>());

			experienciasProfissionais.forEach(e -> {
				preparaExperienciaProfissional(e);

			});
		}
		return this;
	}

	private void preparaExperienciaProfissional(ExperienciaProfissionalAlterarInput e) {
		ExperienciaProfissional experienciaProfissional = new ExperienciaProfissional();

		if (e.getId() != null) {
			experienciaProfissional.setId(e.getId());
		}

		experienciaProfissional.setNomeEmpresa(e.getNomeEmpresa());
		experienciaProfissional.setAvidade(e.getAvidade());
		experienciaProfissional.setDataInicio(e.getDataInicio());
		experienciaProfissional.setDataFim(e.getDataFim());
		experienciaProfissional.setEmpresaAtual(e.getEmpresaAtual());
		experienciaProfissional.setSemExperiencia(e.getSemExperiencia());

		curriculo.getExperieciasProfissionais().add(experienciaProfissional);
	}

	public Curriculo construir() {
		return this.curriculo;
	}

}
