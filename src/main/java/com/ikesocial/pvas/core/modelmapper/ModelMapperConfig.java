package com.ikesocial.pvas.core.modelmapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialAlterarInputEmAssistenteSocia;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialEmAssistenteSocialModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialEmAssistenteSocialResumoModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterAssistenteSocialInputEmAssistenteSocial;

@Configuration
public class ModelMapperConfig {
	
	@Autowired
	private ConverterAssistenteSocialEmAssistenteSocialResumoModel converterAssistenteSocialEmAssistenteSocialResumoModel;

	@Bean
	public ModelMapper modelMapper() {
		var modelMapper = new ModelMapper();
		
			modelMapper.addConverter(converterAssistenteSocialEmAssistenteSocialResumoModel);
			modelMapper.addConverter(new ConverterAssistenteSocialEmAssistenteSocialModel());
			modelMapper.addConverter(new ConverterAssistenteSocialInputEmAssistenteSocial());
			modelMapper.addConverter(new ConverterAssistenteSocialAlterarInputEmAssistenteSocia());
		
		return modelMapper;
	}
	
}
