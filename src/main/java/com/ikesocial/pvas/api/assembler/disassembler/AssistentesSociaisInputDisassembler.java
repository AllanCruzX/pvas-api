package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.AssistenteSocialInput;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public class AssistentesSociaisInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public AssistenteSocial toDomainObject(AssistenteSocialInput assistenteSocialInput) {
		return modelMapper.map(assistenteSocialInput, AssistenteSocial.class);
	}
	
	public void copyToDomainObject(AssistenteSocialInput assistenteSocialInput, AssistenteSocial assistenteSocial) {
		
		modelMapper.map(assistenteSocialInput, assistenteSocial);
	}
	
}
