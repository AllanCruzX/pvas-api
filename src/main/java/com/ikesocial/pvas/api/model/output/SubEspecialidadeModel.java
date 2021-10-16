package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Relation(collectionRelation = "subs-especialidades")
@Getter
@Setter
public class SubEspecialidadeModel extends RepresentationModel<SubEspecialidadeModel> {

	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Atenção Domiciliar")
	private String nome;
	
	private EspecialidadeModel especialidade;

}
