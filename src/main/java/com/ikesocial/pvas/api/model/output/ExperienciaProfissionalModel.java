package com.ikesocial.pvas.api.model.output;

import java.time.LocalDate;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "experiencias-profissionais")
@Getter
@Setter
public class ExperienciaProfissionalModel extends RepresentationModel<ExperienciaProfissionalModel> {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "IKE SOCIAL")
	private String nomeEmpresa;
	
	@ApiModelProperty(example = "Assistente social")
	private String avidade;
	
	@ApiModelProperty(example = "2014-10-07T00:00:00Z")
	private LocalDate dataInicio;
	
	@ApiModelProperty(example = "2021-10-07T00:00:00Z")
	private LocalDate dataFim;
	
	@ApiModelProperty(example = "true")
	private Boolean empresaAtual;

}
