package com.ikesocial.pvas.api.model.input;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ikesocial.pvas.api.model.ModelConstants;
import com.ikesocial.pvas.core.validation.LetraEAcento;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PessoaInput {
	
	@ApiModelProperty(example = "Carolina Maria de Jesus" , required = true)
	@NotBlank
	@Size(min = ModelConstants.STRING_MIN, max = ModelConstants.STRING_MAX)
	@LetraEAcento
	private String nome;
	
	@ApiModelProperty(example = "123", required = true)
	@NotBlank
	private String senha;
	
	@Valid
	@NotNull
	private ContatoInput contato;
	
	@Valid
	@NotNull
	private EnderecoInput endereco;

}
