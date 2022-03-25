package com.ikesocial.pvas.core.modelmapper.converter;

import java.util.Optional;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.ProfissionalResumoModel;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.service.EmailService;

@Component
public  class ConverterProfissionalEmProfissionalResumoModel implements Converter <Profissional, ProfissionalResumoModel> {
	
	@Autowired
	private EmailService emailService;

	@Override
	public ProfissionalResumoModel convert(MappingContext<Profissional, ProfissionalResumoModel> context) {
		
		if (context.getSource() == null) {
			return null;
		}

		ProfissionalResumoModel profissionalResumoModel = new ProfissionalResumoModel();
		profissionalResumoModel.setCodigo(context.getSource().getCodigo());
		profissionalResumoModel.setNome(context.getSource().getNome());
		Optional<Documento> cpf = preparaCpf(context);
		profissionalResumoModel.setCpf(cpf.get().getCodigo());
		Optional<String> email = emailService.recuperaEmailEmMemoria(context.getSource().getContatos());
		profissionalResumoModel.setEmail(email.get());
		profissionalResumoModel.setAtivo(context.getSource().getAtivo());
	
		return profissionalResumoModel;
	}

	private Optional<Documento> preparaCpf(MappingContext<Profissional, ProfissionalResumoModel> context) {
		Optional<Documento> cpf = context.getSource().getDocumentos()
										.stream()
										.filter(Documento::eUmCpf)
										.findFirst();
		return cpf;
	}
	
}
