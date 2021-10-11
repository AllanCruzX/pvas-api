package com.ikesocial.pvas.domain.filter;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AssistenteSocialFilter {
	
	@ApiModelProperty(example = "fc60f245-6c65-4302-9025-89a9d05346a6")
	private String codigo; 
	
	@ApiModelProperty(example = "Carolina Maria de Jesus")
	private String nome;
	
	@ApiModelProperty(example = "75143284082")
	private String cpf;
	
	@ApiModelProperty(example = "carolinamariajesus@ikesocial.com")
	private String email;

}
