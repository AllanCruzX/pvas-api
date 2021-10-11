package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.domain.model.PessoaFisica;

@Component
public class AssistenteSocialModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public AssistenteSocialModel toModel(PessoaFisica assistenteSocial) {
		return modelMapper.map(assistenteSocial, AssistenteSocialModel.class);
	}

	public List<AssistenteSocialModel> toCollectionModel(List<PessoaFisica> assistentesSociais) {
		return assistentesSociais.stream()
				.map(assistenteSocial -> toModel(assistenteSocial))
				.collect(Collectors.toList());
	}

}
