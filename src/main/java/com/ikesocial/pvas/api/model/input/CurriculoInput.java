package com.ikesocial.pvas.api.model.input;

import java.util.Set;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CurriculoInput {

	@Valid
	@NotNull
	private ProfissionalCodigoInput profissional;

	private Set<IdiomaIdInput> idiomas;

	private Set<EspecializacaoIdInput> especializacoes;

	private Set<SubEspecialidadeIdInput> subEspecialidades;
	
	private Set<ProfissaoIdInput> profissoes;
	
	private Set<CursoInput> cursos;
	
	private Set<ExperienciaProfissionalInput> experienciasProfissionais;

}
