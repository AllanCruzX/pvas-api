package com.ikesocial.pvas.api.model.output;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Relation(collectionRelation = "assistentes-sociais")
@Getter
@Setter
public class AssistenteSocialModel extends RepresentationModel<AssistenteSocialModel> {
	
	@ApiModelProperty(example = "fc60f245-6c65-4302-9025-89a9d05346a6")
	private String codigo;
	
	@ApiModelProperty(example = "Carolina Maria de Jesus")
	private String nome;
	
	@ApiModelProperty(example = "true")
	private Boolean ativo;
	
	@ApiModelProperty(example = "Maria de Jesus")
	private String nomeMae;
	
	@ApiModelProperty(example = "1988-10-07")
	private LocalDate dataNascimento;
	
	@ApiModelProperty(example = "false")
	private Boolean pne;
	
	private SexoModel sexo;
	
	private EstadoCivilModel estadoCivil;
	
	private ContatoModel contato;
	
	private EnderecoModel endereco;
	
	private DocumentoPessoaFisicaModel documento;
	
	private Set<IdiomaModel> idiomas;
	
	private Set<EspecializacaoModel> especializacoes;
	
	private Set<SubEspecialidadeModel> subEspecialidades;
	
	private List<CursoModel> cusos;
	
	private List<ExperienciaProfissionalModel> experienciasProfissionais;

}
