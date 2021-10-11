package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentoPessoaFisicaModel {
	
	@ApiModelProperty(example = "75143284082")
	private String cpf;
	
	@ApiModelProperty(example = "77548484")
	private String cress;
	
	@ApiModelProperty(example = "BA")
	private String cressEstadoSigla;

}
