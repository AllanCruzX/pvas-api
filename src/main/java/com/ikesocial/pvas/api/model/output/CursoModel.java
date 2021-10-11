package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CursoModel {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Assistente social autônomo")
	private String nome;
	
	@ApiModelProperty(example = "200")
	private String chagaHoraria;

}
