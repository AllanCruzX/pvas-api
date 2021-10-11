package com.ikesocial.pvas.api.assembler.disassembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.input.ExperienciaProfissionalInput;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.PessoaFisica;

@Component
public class ExperienciaProfissionalInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;

	public ExperienciaProfissional toDomainObject(ExperienciaProfissionalInput experienciaProfissionalInput) {
		
		return modelMapper.map(experienciaProfissionalInput, ExperienciaProfissional.class);
	}

	public void copyToDomainObject(ExperienciaProfissionalInput experienciaProfissionalInput,
			ExperienciaProfissional experienciaProfissional) {

		experienciaProfissional.setPessoaFisica(new PessoaFisica());

		modelMapper.map(experienciaProfissionalInput, experienciaProfissional);
	}

}
