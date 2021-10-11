package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;


@Component
public class ExperienciaProfissionalModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public ExperienciaProfissionalModel toModel(ExperienciaProfissional experienciaProfissional) {
		return modelMapper.map(experienciaProfissional, ExperienciaProfissionalModel.class);
	}

	public List<ExperienciaProfissionalModel> toCollectionModel(List<ExperienciaProfissional> experienciasProfissionais) {
		return experienciasProfissionais.stream()
				.map(experienciaProfissional -> toModel(experienciaProfissional))
				.collect(Collectors.toList());
	}

}
