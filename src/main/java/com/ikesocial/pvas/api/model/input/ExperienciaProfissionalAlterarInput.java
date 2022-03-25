package com.ikesocial.pvas.api.model.input;

import java.time.LocalDate;

import javax.validation.constraints.NotNull;

import com.ikesocial.pvas.core.validation.LetraNumeroEAcento;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ExperienciaProfissionalAlterarInput {
	
	@ApiModelProperty(example = "1")
	@NotNull
	private Long id;
	
	@ApiModelProperty(example = "IKE SOCIAL")
	@LetraNumeroEAcento
	private String nomeEmpresa;
	
	@ApiModelProperty(example = "Atuei como assistente social ...")
	private String avidade;
	
	@ApiModelProperty(example = "2014-10-07T00:00:00Z")
	private LocalDate dataInicio;
	
	@ApiModelProperty(example = "2021-10-07T00:00:00Z")
	private LocalDate dataFim;
	
	@ApiModelProperty(example = "true")
	private Boolean empresaAtual;
	
	@ApiModelProperty(example = "false")
	private Boolean semExperiencia;
}

