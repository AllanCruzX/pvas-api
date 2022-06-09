package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.EstadoCivilController;
import com.ikesocial.pvas.api.model.output.EstadoCivilModel;
import com.ikesocial.pvas.domain.enums.EstadoCivil;

@Component
public class EstadoCivilModelAssembler extends RepresentationModelAssemblerSupport<EstadoCivil, EstadoCivilModel> {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;

	public EstadoCivilModelAssembler() {
		super(EstadoCivilController.class, EstadoCivilModel.class);
	}

	@Override
	public EstadoCivilModel toModel(EstadoCivil estadoCivil) {
		EstadoCivilModel estadoCivilModel = createModelWithId(estadoCivil.getId(), estadoCivil);
		modelMapper.map(estadoCivil, estadoCivilModel);
		
		estadoCivilModel.add(pvasLinks.linkToEstadoCivis("estados-civis"));

		return estadoCivilModel;
	}

	@Override
	public CollectionModel<EstadoCivilModel> toCollectionModel(Iterable<? extends EstadoCivil> entities) {
		return super.toCollectionModel(entities)
						.add(linkTo(EstadoCivilController.class).withSelfRel());
	}

}
