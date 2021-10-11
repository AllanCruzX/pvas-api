package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentoPessoaJuridicaModel {
	
	@ApiModelProperty(example = "61553155000140")
	private String cnpj;

}
