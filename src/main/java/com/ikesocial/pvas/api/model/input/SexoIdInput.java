package com.ikesocial.pvas.api.model.input;

import javax.validation.constraints.NotNull;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SexoIdInput {
	
	@ApiModelProperty(example = "1")
	@NotNull
	private Long id;

}
