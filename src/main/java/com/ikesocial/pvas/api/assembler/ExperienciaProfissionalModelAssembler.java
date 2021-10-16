package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.ExperienciaProfissionalController;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

@Component
public class ExperienciaProfissionalModelAssembler
		extends RepresentationModelAssemblerSupport<ExperienciaProfissional, ExperienciaProfissionalModel> {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;

	public ExperienciaProfissionalModelAssembler() {
		super(ExperienciaProfissionalController.class, ExperienciaProfissionalModel.class);
	}

	@Override
	public ExperienciaProfissionalModel toModel(ExperienciaProfissional experienciaProfissional) {
		ExperienciaProfissionalModel experienciaProfissionalModel = createModelWithId(experienciaProfissional.getId(),
				experienciaProfissional);
		modelMapper.map(experienciaProfissional, experienciaProfissionalModel);
		
		experienciaProfissionalModel.add(pvasLinks.linkToExperienciasProfissionais("experiencias-profissionais"));

		return experienciaProfissionalModel;
	}

	@Override
	public CollectionModel<ExperienciaProfissionalModel> toCollectionModel(
			Iterable<? extends ExperienciaProfissional> entities) {
		return super.toCollectionModel(entities)
						.add(linkTo(ExperienciaProfissionalController.class).withSelfRel());
	}

}
