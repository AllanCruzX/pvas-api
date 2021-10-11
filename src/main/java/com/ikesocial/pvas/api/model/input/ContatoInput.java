package com.ikesocial.pvas.api.model.input;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import com.ikesocial.pvas.core.validation.Facebook;
import com.ikesocial.pvas.core.validation.Instagram;
import com.ikesocial.pvas.core.validation.Linkedin;
import com.ikesocial.pvas.core.validation.Site;
import com.ikesocial.pvas.core.validation.Telefone;
import com.ikesocial.pvas.core.validation.Youtube;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ContatoInput {
	
	@ApiModelProperty(example = "71992587456" , required = true)
	@NotBlank
	@Telefone
	private String celular;
	
	@ApiModelProperty(example = "carolinamariajesus@ikesocial.com", required = true)
	@NotBlank
	@Email
	private String email;
	
	@ApiModelProperty(example = "https://www.facebook.com/carol.jesus.509/")
	@Facebook
	private String facebook;

	@ApiModelProperty(example = "https://www.instagram.com/carolinamariajesus/")
	@Instagram
	private String instagram;
	
	@ApiModelProperty(example = "https://www.youtube.com/channel/UCku0_K6LlkscSoVfE5J_LsQ")
	@Youtube
	private String youtube;
	
	@ApiModelProperty(example = "https://www.linkedin.com/in/carolina-mariajesus-81aaa581/")
	@Linkedin		
	private String linkedin;
	
	@ApiModelProperty(example = "https://ikesocial.com/banco-de-talentos/carolinamariajesus/")
	@Site
	private String site;
}
