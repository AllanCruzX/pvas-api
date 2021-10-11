package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.CursoModel;
import com.ikesocial.pvas.domain.model.Curso;

@Component
public class CursoModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public CursoModel toModel(Curso curso) {
		return modelMapper.map(curso, CursoModel.class);
	}

	public List<CursoModel> toCollectionModel(List<Curso> cursos) {
		return cursos.stream()
				.map(curso -> toModel(curso))
				.collect(Collectors.toList());
	}

}
