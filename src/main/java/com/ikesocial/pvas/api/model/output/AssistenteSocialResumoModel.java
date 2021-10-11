package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AssistenteSocialResumoModel extends PessoaResumoModel {
	
	@ApiModelProperty(example = "75143284082")
	private String cpf;

}
