package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Relation(collectionRelation = "contatos")
@Getter
@Setter
public class ContatoModel extends RepresentationModel<ContatoModel>{
	
	@ApiModelProperty(example = "71992587456")
	private String celular;
	
	@ApiModelProperty(example = "carolinamariajesus@ikesocial.com")
	private String email;
	
	@ApiModelProperty(example = "https://www.facebook.com/carol.jesus.509/")
	private String facebook;
	
	@ApiModelProperty(example = "https://www.instagram.com/carolinamariajesus/")
	private String instagran;
	
	@ApiModelProperty(example = "https://www.youtube.com/channel/UCku0_K6LlkscSoVfE5J_LsQ")
	private String youtube;
	
	@ApiModelProperty(example = "https://www.linkedin.com/in/carolina-mariajesus-81aaa581/")
	private String linkedin;
	
	@ApiModelProperty(example = "https://ikesocial.com/banco-de-talentos/carolinamariajesus/")
	private String site;

}
