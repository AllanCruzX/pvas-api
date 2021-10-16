package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.CursoInput;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public class CursoInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public Curso toDomainObject(CursoInput cursoInput) {
		
		return modelMapper.map(cursoInput, Curso.class);
	}
	
	public void copyToDomainObject(CursoInput cursoInput, Curso curso) {
		
		curso.setAssistenteSocial(new AssistenteSocial());
		
		modelMapper.map(cursoInput, curso);
	}
	
}
