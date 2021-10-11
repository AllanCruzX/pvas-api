package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PessoaJuridicaModel  extends PessoaModel {
	
	@ApiModelProperty(example = "Nascemos com o objetivo de levar soluções no âmbito social para pessoas.")
	private String visao;
	
	@ApiModelProperty(example = "Inovação")
	private String valor;
	
	private DocumentoPessoaJuridicaModel documento;

}
