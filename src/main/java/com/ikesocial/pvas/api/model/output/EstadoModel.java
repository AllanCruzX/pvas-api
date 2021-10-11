package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "estados")
@Getter
@Setter
public class EstadoModel extends RepresentationModel<EstadoModel> {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Bahia")
	private String nome;
	
	@ApiModelProperty(example = "BA")
	private String sigla;

}
