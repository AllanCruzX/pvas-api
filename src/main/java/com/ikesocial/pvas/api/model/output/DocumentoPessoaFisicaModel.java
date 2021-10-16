package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "documentos")
@Getter
@Setter
public class DocumentoPessoaFisicaModel extends RepresentationModel<DocumentoPessoaFisicaModel> {
	
	@ApiModelProperty(example = "75143284082")
	private String cpf;
	
	@ApiModelProperty(example = "77548484")
	private String cress;
	
	@ApiModelProperty(example = "BA")
	private String cressEstadoSigla;

}
