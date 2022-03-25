package com.ikesocial.pvas.api.model.output;

import java.time.LocalDate;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Relation(collectionRelation = "profissionais")
@Getter
@Setter
public class ProfissionalModel extends RepresentationModel<ProfissionalModel> {
	
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
	
	private DocumentoDoProfissionalModel documento;
	
	private CurriculoModel curriculo;

}
