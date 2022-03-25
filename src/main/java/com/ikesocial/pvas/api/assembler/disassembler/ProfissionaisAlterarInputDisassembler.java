package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.ProfissionalAlterarInput;
import com.ikesocial.pvas.domain.model.Profissional;

@Component
public class ProfissionaisAlterarInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public Profissional toDomainObject(ProfissionalAlterarInput profissionalAlterarInput) {
		
		return modelMapper.map(profissionalAlterarInput, Profissional.class);
	}
	
	public void copyToDomainObject(ProfissionalAlterarInput profissionalAlterarInput, Profissional profissional) {
		  modelMapper.map(profissionalAlterarInput, profissional);
	}
	
}
