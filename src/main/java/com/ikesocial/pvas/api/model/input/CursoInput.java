package com.ikesocial.pvas.api.model.input;

import javax.validation.constraints.PositiveOrZero;

import com.ikesocial.pvas.core.validation.LetraNumeroEAcento;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CursoInput {
	
	@ApiModelProperty(example = "Assistente social autônomo")
	@LetraNumeroEAcento
	private String nome;
	
	@ApiModelProperty(example = "200")
	@PositiveOrZero
	private int chagaHoraria;
	
}

