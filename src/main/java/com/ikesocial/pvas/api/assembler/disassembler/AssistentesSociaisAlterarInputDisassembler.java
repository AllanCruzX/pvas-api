package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.AssistenteSocialAlterarInput;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public class AssistentesSociaisAlterarInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public void copyToDomainObject(AssistenteSocialAlterarInput assistenteSocialAlterarInput, AssistenteSocial assistenteSocial) {
		  modelMapper.map(assistenteSocialAlterarInput, assistenteSocial);
	}
	
}
