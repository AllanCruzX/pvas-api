package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "profissionais")
@Getter
@Setter
public class ProfissionalResumoModel extends RepresentationModel<ProfissionalResumoModel> {
	
	@ApiModelProperty(example = "fc60f245-6c65-4302-9025-89a9d05346a6")
	private String codigo;
	
	@ApiModelProperty(example = "Carolina Maria de Jesus")
	private String nome;
	
	@ApiModelProperty(example = "carolinamariajesus@ikesocial.com")
	private String email;
	
	@ApiModelProperty(example = "75143284082")
	private String cpf;
	
	@ApiModelProperty(example = "true")
	private Boolean ativo;

}
