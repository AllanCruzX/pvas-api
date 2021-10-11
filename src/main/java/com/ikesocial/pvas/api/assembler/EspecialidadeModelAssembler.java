package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.EspecialidadeModel;
import com.ikesocial.pvas.domain.model.Especialidade;

@Component
public class EspecialidadeModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public EspecialidadeModel toModel(Especialidade especialidade) {
		return modelMapper.map(especialidade, EspecialidadeModel.class);
	}

	public List<EspecialidadeModel> toCollectionModel(List<Especialidade> especialidades) {
		return especialidades.stream()
				.map(especialidade -> toModel(especialidade))
				.collect(Collectors.toList());
	}

}
