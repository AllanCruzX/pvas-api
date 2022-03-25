package com.ikesocial.pvas.core.modelmapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ikesocial.pvas.core.modelmapper.converter.ConverterCurriculoAlterarlInputEmCurriculo;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterCurriculoEmCurriculoModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterCurriculolInputEmCurriculo;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterProfissionalAlterarInputEmProfissional;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterProfissionalEmProfissionalModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterProfissionalEmProfissionalResumoModel;
import com.ikesocial.pvas.core.modelmapper.converter.ConverterProfissionalInputEmProfissional;

@Configuration
public class ModelMapperConfig {
	
	@Autowired
	private ConverterProfissionalEmProfissionalResumoModel  converterProfissionalEmProfissionalResumoModel;

	@Bean
	public ModelMapper modelMapper() {
		var modelMapper = new ModelMapper();
		
			modelMapper.addConverter(converterProfissionalEmProfissionalResumoModel);
			modelMapper.addConverter(new ConverterProfissionalEmProfissionalModel());
			modelMapper.addConverter(new ConverterProfissionalInputEmProfissional());
			modelMapper.addConverter(new ConverterProfissionalAlterarInputEmProfissional());
			modelMapper.addConverter(new ConverterCurriculolInputEmCurriculo());
			modelMapper.addConverter(new ConverterCurriculoEmCurriculoModel());
			modelMapper.addConverter(new ConverterCurriculoAlterarlInputEmCurriculo());
			
		return modelMapper;
	}
	
}
