package com.ikesocial.pvas.core.modelmapper.converter;

import java.util.Optional;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.service.EmailService;

@Component
public  class ConverterAssistenteSocialEmAssistenteSocialResumoModel implements Converter <AssistenteSocial, AssistenteSocialResumoModel> {
	
	@Autowired
	private EmailService emailService;

	@Override
	public AssistenteSocialResumoModel convert(MappingContext<AssistenteSocial, AssistenteSocialResumoModel> context) {
		
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

	private Optional<Documento> preparaCpf(MappingContext<AssistenteSocial, AssistenteSocialResumoModel> context) {
		Optional<Documento> cpf = context.getSource().getDocumentos()
										.stream()
										.filter(Documento::eUmCpf)
										.findFirst();
		return cpf;
	}
	
}
