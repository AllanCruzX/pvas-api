package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnderecoModel {
	
	@ApiModelProperty(example = "Rua Floriano Peixoto")
	private String logradouro;
	
	@ApiModelProperty(example = "Centro")
	private String bairro;
	
	@ApiModelProperty(example = "555")
	private String numero;
	
	@ApiModelProperty(example = "Ap:105")
	private String complemento;
	
	@ApiModelProperty(example = "38400000")
	private String cep;
	
	private CidadeModel cidade;

}
