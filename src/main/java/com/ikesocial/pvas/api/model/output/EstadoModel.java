package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EstadoModel {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Bahia")
	private String nome;
	
	@ApiModelProperty(example = "BA")
	private String sigla;

}
