package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.AssistenteSocialInput;
import com.ikesocial.pvas.domain.model.PessoaFisica;

@Component
public class AssistentesSociaisInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public PessoaFisica toDomainObject(AssistenteSocialInput assistenteSocialInput) {
		return modelMapper.map(assistenteSocialInput, PessoaFisica.class);
	}
	
	public void copyToDomainObject(AssistenteSocialInput assistenteSocialInput, PessoaFisica assistenteSocial) {
		
		modelMapper.map(assistenteSocialInput, assistenteSocial);
	}
	
}
