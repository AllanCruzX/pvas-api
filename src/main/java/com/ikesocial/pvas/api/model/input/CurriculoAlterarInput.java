package com.ikesocial.pvas.api.model.input;

import java.util.Set;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CurriculoAlterarInput {
	
	@Valid
	@NotNull
	private ProfissionalCodigoInput profissional;

	@Valid
	private Set<IdiomaIdInput> idiomas;

	@Valid
	private Set<EspecializacaoIdInput> especializacoes;

	@Valid
	private Set<SubEspecialidadeIdInput> subEspecialidades;
	
	@Valid
	private Set<ProfissaoIdInput> profissoes;
	
	@Valid
	private Set<CursoAlterarInput> cursos;
	
	@Valid
	private Set<ExperienciaProfissionalAlterarInput> experienciasProfissionais;

}
