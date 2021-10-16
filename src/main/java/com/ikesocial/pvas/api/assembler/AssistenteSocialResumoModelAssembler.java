package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.AssistenteSocialController;
import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public class AssistenteSocialResumoModelAssembler
		extends RepresentationModelAssemblerSupport<AssistenteSocial, AssistenteSocialResumoModel> {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private PvasLinks pvasLinks;

	public AssistenteSocialResumoModelAssembler() {
		super(AssistenteSocialController.class, AssistenteSocialResumoModel.class);
	}

	@Override
	public AssistenteSocialResumoModel toModel(AssistenteSocial assistenteSocial) {
		AssistenteSocialResumoModel assistenteSocialResumoModel = modelMapper.map(assistenteSocial,
				AssistenteSocialResumoModel.class);

		assistenteSocialResumoModel.add(pvasLinks.linkToAssistenteSocial(assistenteSocialResumoModel.getCodigo()));
		assistenteSocialResumoModel.add(pvasLinks.linkToAssistentesSociais());


		if (assistenteSocial.ativacaoPermitida()) {
			assistenteSocialResumoModel
					.add(pvasLinks.linkToAssistenteSocialAtivar(assistenteSocialResumoModel.getCodigo(), "ativar"));
		}

		if (assistenteSocial.inativacaoPermitida()) {
			assistenteSocialResumoModel
					.add(pvasLinks.linkToAssistenteSocialInativar(assistenteSocialResumoModel.getCodigo(), "inativar"));
		}

		return assistenteSocialResumoModel;

	}

}
