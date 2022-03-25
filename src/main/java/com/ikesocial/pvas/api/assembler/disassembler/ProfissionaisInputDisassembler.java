package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.ProfissionalInput;
import com.ikesocial.pvas.domain.model.Profissional;

@Component
public class ProfissionaisInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public Profissional toDomainObject(ProfissionalInput profissionalInput) {
		return modelMapper.map(profissionalInput, Profissional.class);
	}
	
	public void copyToDomainObject(ProfissionalInput profissionalInput, Profissional profissional) {
		
		modelMapper.map(profissionalInput, profissional);
	}
	
}
