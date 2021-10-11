package com.ikesocial.pvas.core.client;

import javax.validation.constraints.NotNull;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import org.springframework.validation.annotation.Validated;

import lombok.Getter;
import lombok.Setter;

@Validated
@Getter
@Setter
@Component
@ConfigurationProperties("pvas.client")
public class ClientProperties {
	
	private ViaCep viacep = new ViaCep();
	
	@Getter
	@Setter
	public class ViaCep {
		
		@NotNull
		private String url;
		
		@NotNull
		private String path;
		
	}
	
	
}
