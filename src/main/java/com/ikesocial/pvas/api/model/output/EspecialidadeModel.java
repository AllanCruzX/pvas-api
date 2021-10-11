package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EspecialidadeModel {

	@ApiModelProperty(example = "1")
	private Long id;

	@ApiModelProperty(example = "saúde")
	private String nome;

}
