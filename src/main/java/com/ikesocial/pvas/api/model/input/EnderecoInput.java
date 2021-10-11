package com.ikesocial.pvas.api.model.input;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.ikesocial.pvas.api.model.ModelConstants;
import com.ikesocial.pvas.core.validation.Cep;
import com.ikesocial.pvas.core.validation.LetraEAcento;
import com.ikesocial.pvas.core.validation.SoNumeroELetra;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnderecoInput {
	
	@ApiModelProperty(example = "38400000" , required =  true)
	@NotBlank
	@Cep
	private String cep;

	@ApiModelProperty(example = "Rua Floriano Peixoto" , required =  true)
	@Size(min = ModelConstants.STRING_MIN, max = ModelConstants.STRING_MAX)
	@NotBlank
	@LetraEAcento
	private String logradouro;

	@ApiModelProperty(example = "Centro" , required =  true)
	@Size(min = ModelConstants.STRING_MIN, max = ModelConstants.STRING_MAX)
	@NotBlank
	@LetraEAcento
	private String bairro;

	@ApiModelProperty(example = "555" , required =  true)
	@NotBlank
	@SoNumeroELetra
	private String numero;
	
	@ApiModelProperty(example = "Ap:105")
	@Size(min = ModelConstants.STRING_MIN, max = ModelConstants.STRING_MAX)
	@SoNumeroELetra
	private String complemento;

	@Valid
	@NotNull
	private CidadeIdInput cidade;

}
