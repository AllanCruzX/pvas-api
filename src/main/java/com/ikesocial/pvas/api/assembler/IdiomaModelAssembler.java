package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.domain.model.Idioma;

@Component
public class IdiomaModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public IdiomaModel toModel(Idioma idioma) {
		return modelMapper.map(idioma, IdiomaModel.class);
	}

	public List<IdiomaModel> toCollectionModel(List<Idioma> idiomas) {
		return idiomas.stream()
				.map(idioma -> toModel(idioma))
				.collect(Collectors.toList());
	}

}
