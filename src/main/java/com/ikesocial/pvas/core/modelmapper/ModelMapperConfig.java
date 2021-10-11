package com.ikesocial.pvas.core.modelmapper;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialEmAssistenteSocialModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialEmAssistenteSocialResumoModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialInputEmAssistenteSocial;

@Configuration
public class ModelMapperConfig {

	@Bean
	public ModelMapper modelMapper() {
		var modelMapper = new ModelMapper();
			
			modelMapper.addConverter(new ConverterAssistenteSocialEmAssistenteSocialResumoModel());
			modelMapper.addConverter(new ConverterAssistenteSocialEmAssistenteSocialModel());
			modelMapper.addConverter(new ConverterAssistenteSocialInputEmAssistenteSocial());
		
		return modelMapper;
	}
	
}
