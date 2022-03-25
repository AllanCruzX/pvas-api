package com.ikesocial.pvas.api.model.input;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.ikesocial.pvas.api.model.ModelConstants;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProfissionalCodigoInput {
	
	@NotBlank
	@Size(min = ModelConstants.CODIGO_MIN, max = ModelConstants.CODIGO_MAX)
	private String codigo;

}
