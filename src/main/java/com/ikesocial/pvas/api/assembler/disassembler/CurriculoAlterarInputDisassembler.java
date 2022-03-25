package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.CurriculoAlterarInput;
import com.ikesocial.pvas.domain.model.Curriculo;

@Component
public class CurriculoAlterarInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public Curriculo toDomainObject(CurriculoAlterarInput curriculoAlterarInput) {
		
		return modelMapper.map(curriculoAlterarInput, Curriculo.class);
	}
	
	public void copyToDomainObject(CurriculoAlterarInput curriculoAlterarInput, Curriculo curso) {
		
		modelMapper.map(curriculoAlterarInput, curso);
	}
	
}
