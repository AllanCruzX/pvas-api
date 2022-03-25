package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.ProfissionalController;
import com.ikesocial.pvas.api.model.output.ProfissionalResumoModel;
import com.ikesocial.pvas.domain.model.Profissional;

@Component
public class ProfissionalResumoModelAssembler
		extends RepresentationModelAssemblerSupport<Profissional, ProfissionalResumoModel> {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private PvasLinks pvasLinks;

	public ProfissionalResumoModelAssembler() {
		super(ProfissionalController.class, ProfissionalResumoModel.class);
	}

	@Override
	public ProfissionalResumoModel toModel(Profissional profissional) {
		ProfissionalResumoModel profissionalResumoModel = modelMapper.map(profissional,
				ProfissionalResumoModel.class);

		profissionalResumoModel.add(pvasLinks.linkToProfissional(profissionalResumoModel.getCodigo()));
		profissionalResumoModel.add(pvasLinks.linkToProfissionais());


		if (profissional.ativacaoPermitida()) {
			profissionalResumoModel
					.add(pvasLinks.linkToProfissionalAtivar(profissionalResumoModel.getCodigo(), "ativar"));
		}

		if (profissional.inativacaoPermitida()) {
			profissionalResumoModel
					.add(pvasLinks.linkToProfissionalInativar(profissionalResumoModel.getCodigo(), "inativar"));
		}

		return profissionalResumoModel;

	}

}
