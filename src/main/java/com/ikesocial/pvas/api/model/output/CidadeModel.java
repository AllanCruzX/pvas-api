package com.ikesocial.pvas.api.model.output;

import org.springframework.hateoas.RepresentationModel;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CidadeModel extends RepresentationModel<CidadeModel> {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Salvador")
	private String nome;
	
	private EstadoModel estado;

}
