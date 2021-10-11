package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.EstadoCivilModel;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;

@Component
public class EstadoCivilModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public EstadoCivilModel toModel(EstadoCivil estadoCivil) {
		return modelMapper.map(estadoCivil, EstadoCivilModel.class);
	}

	public List<EstadoCivilModel> toCollectionModel(List<EstadoCivil> estadosCivis) {
		return estadosCivis.stream()
				.map(estadoCivil -> toModel(estadoCivil))
				.collect(Collectors.toList());
	}

}
