package com.ikesocial.pvas.api.model.output;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FotoAssistenteSocialModel {

	@ApiModelProperty(example = "maria.jpg")
	private String nomeArquivo;
	
	@ApiModelProperty(example = "foto de perfil")
	private String descricao;
	
	@ApiModelProperty(example = "image/jpeg")
	private String contentType;
	
	@ApiModelProperty(example = "202912")
	private Long tamanho;
	
}
