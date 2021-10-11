package com.ikesocial.pvas.api.model.output;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class AssistenteSocialModel extends PessoaModel {
	
	@ApiModelProperty(example = "Maria de Jesus")
	private String nomeMae;
	
	@ApiModelProperty(example = "1988-10-07")
	private LocalDate dataNascimento;
	
	private SexoModel sexo;
	
	private EstadoCivilModel estadoCivil;
	
	@ApiModelProperty(example = "false")
	private Boolean pne;
	
	private DocumentoPessoaFisicaModel documento;
	
	private Set<IdiomaModel> idiomas;
	
	private Set<EspecializacaoModel> especializacoes;
	
	private Set<SubEspecialidadeModel> subEspecialidades;
	
	private List<CursoModel> cusos;
	
	private List<ExperienciaProfissionalModel> experienciasProfissionais;

}
