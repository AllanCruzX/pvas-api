package com.ikesocial.pvas.core.modelmapper.converter;

import java.util.Optional;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.service.EmailService;

public  class ConverterAssistenteSocialEmAssistenteSocialResumoModel implements Converter <PessoaFisica, AssistenteSocialResumoModel> {
	
	@Autowired
	private EmailService emailService;

	@Override
	public AssistenteSocialResumoModel convert(MappingContext<PessoaFisica, AssistenteSocialResumoModel> context) {
		
		if (context.getSource() == null) {
			return null;
		}

		AssistenteSocialResumoModel assistenteSocialResumoModel = new AssistenteSocialResumoModel();
		assistenteSocialResumoModel.setCodigo(context.getSource().getCodigo());
		assistenteSocialResumoModel.setNome(context.getSource().getNome());
		Optional<Documento> cpf = preparaCpf(context);
		assistenteSocialResumoModel.setCpf(cpf.get().getCodigo());
		Optional<String> email = emailService.recuperaEmailEmMemoria(context.getSource().getContatos());
		assistenteSocialResumoModel.setEmail(email.get());
		assistenteSocialResumoModel.setAtivo(context.getSource().getAtivo());
	
		return assistenteSocialResumoModel;
	}

	private Optional<Documento> preparaCpf(MappingContext<PessoaFisica, AssistenteSocialResumoModel> context) {
		Optional<Documento> cpf = context.getSource().getDocumentos()
										.stream()
										.filter(Documento::eUmCpf)
										.findFirst();
		return cpf;
	}

	
	
}
