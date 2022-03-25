package com.ikesocial.pvas.api.model.input;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.br.CPF;

import com.ikesocial.pvas.api.model.ModelConstants;
import com.ikesocial.pvas.core.validation.SoNumero;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DocumentoDoProfissionalInput {

	@ApiModelProperty(example = "75143284082" , required = true)
	@CPF
	private String cpf;
	
	@ApiModelProperty(example = "77548484" , required = true)
	@Size(min = ModelConstants.CRESS_MIN, max = ModelConstants.CRESS_MAX)
	@NotNull
	@SoNumero
	private String cress;

	@Valid
	@NotNull
	private EstadoIdInput estadoCress;

}
