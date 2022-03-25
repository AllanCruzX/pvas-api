package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.CurriculoInput;
import com.ikesocial.pvas.domain.model.Curriculo;

@Component
public class CurriculoInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public Curriculo toDomainObject(CurriculoInput curriculoInput) {
		
		return modelMapper.map(curriculoInput, Curriculo.class);
	}
	
	public void copyToDomainObject(CurriculoInput curriculoInput, Curriculo curso) {
		
		modelMapper.map(curriculoInput, curso);
	}
	
}
