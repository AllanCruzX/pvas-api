package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "fotos")
@Getter
@Setter
public class FotoAssistenteSocialModel  extends RepresentationModel<FotoAssistenteSocialModel>{

	@ApiModelProperty(example = "maria.jpg")
	private String nomeArquivo;
	
	@ApiModelProperty(example = "foto de perfil")
	private String descricao;
	
	@ApiModelProperty(example = "image/jpeg")
	private String contentType;
	
	@ApiModelProperty(example = "202912")
	private Long tamanho;
	
}
