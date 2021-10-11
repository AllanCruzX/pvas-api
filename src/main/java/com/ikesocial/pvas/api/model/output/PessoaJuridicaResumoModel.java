package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PessoaJuridicaResumoModel  extends PessoaResumoModel {
	
	@ApiModelProperty(example = "92596359000191")
	private String cnpj;

}
