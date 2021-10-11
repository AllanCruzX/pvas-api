package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.FotoAssistenteSocialModel;
import com.ikesocial.pvas.domain.model.FotoPessoa;

@Component
public class FotoAssistenteSocialModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public FotoAssistenteSocialModel toModel(FotoPessoa foto) {
		return modelMapper.map(foto, FotoAssistenteSocialModel.class);
	}

	

}
