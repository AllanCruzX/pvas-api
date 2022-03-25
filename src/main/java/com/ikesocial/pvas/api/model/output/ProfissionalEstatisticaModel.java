package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "estatisticas")
@Getter
@Setter
public class ProfissionalEstatisticaModel extends RepresentationModel<ProfissionalEstatisticaModel> {
	
	@ApiModelProperty(example = "1000000")
	private Long total;
	
	@ApiModelProperty(example = "true")
	private Boolean ativo;

}
