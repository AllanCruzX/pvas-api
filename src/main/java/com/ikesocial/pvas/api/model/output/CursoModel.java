package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "cursos")
@Getter
@Setter
public class CursoModel extends RepresentationModel<CursoModel> {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Assistente social autônomo")
	private String nome;
	
	@ApiModelProperty(example = "50")
	private Long chagaHoraria;

}
