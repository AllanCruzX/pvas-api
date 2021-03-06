package com.ikesocial.pvas.api.model.input;

import java.time.LocalDate;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProfissionalInput extends PessoaInput {
	
	@ApiModelProperty(example = "123", required = true)
	@NotBlank
	private String senha;
	
	@ApiModelProperty(example = "Maria de Jesus")
	private String nomeMae;
	
	@ApiModelProperty(example = "1988-10-07" , required = true)
	@NotNull
	private LocalDate dataNascimento;
	
	@Valid
	@NotNull
	private SexoIdInput sexo;
	
	@Valid
	@NotNull
	private EstadoCivilIdInput estadoCivil;
	
	@ApiModelProperty(example = "false" , required = true)
	@Valid
	@NotNull
	private Boolean pne;
	
	@Valid
	@NotNull
	private DocumentoDoProfissionalInput documento;
	
	//private Set<IdiomaIdInput> idiomas;
	
	//private Set<EspecializacaoIdInput> especializacoes;
	
	//private Set<SubEspecialidadeIdInput> subEspecialidades;
	
	//private Set<CursoIdInput> cursos;
	
	//private Set<ExperienciaProfissionalIdInput> experienciasProfissionais;

}
