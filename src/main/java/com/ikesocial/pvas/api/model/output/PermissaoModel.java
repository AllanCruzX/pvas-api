package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "permissoes")
@Setter
@Getter
public class PermissaoModel extends RepresentationModel<PermissaoModel> {

	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "CONSULTAR_ASSISTENTE_SOCIAL")
	private String nome;
	
	@ApiModelProperty(example = "Permite consultar assistentes sociais")
	private String descricao;
	
}
