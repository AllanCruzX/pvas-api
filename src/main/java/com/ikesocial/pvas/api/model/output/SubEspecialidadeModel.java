package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SubEspecialidadeModel {

	@ApiModelProperty(example = "1")
	private Long id;
	
	@ApiModelProperty(example = "Atenção Domiciliar")
	private String nome;
	
	private EspecialidadeModel especialidade;

}
