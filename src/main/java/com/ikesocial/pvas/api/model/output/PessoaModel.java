package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class PessoaModel {
	
	@ApiModelProperty(example = "fc60f245-6c65-4302-9025-89a9d05346a6")
	private String codigo;
	
	@ApiModelProperty(example = "Carolina Maria de Jesus")
	private String nome;
	
	private ContatoModel contato;
	
	private EnderecoModel endereco;
	
	@ApiModelProperty(example = "true")
	private Boolean ativo;

}
