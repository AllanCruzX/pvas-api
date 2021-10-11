package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.domain.model.SubEspecialidade;

@Component
public class SubEspecialidadeModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public SubEspecialidadeModel toModel(SubEspecialidade subEspecialidade) {
		return modelMapper.map(subEspecialidade, SubEspecialidadeModel.class);
	}

	public List<SubEspecialidadeModel> toCollectionModel(List<SubEspecialidade> subEspecialidades) {
		return subEspecialidades.stream()
				.map(especialidade -> toModel(especialidade))
				.collect(Collectors.toList());
	}

}
