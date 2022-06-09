package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.SexoController;
import com.ikesocial.pvas.api.model.output.SexoModel;
import com.ikesocial.pvas.domain.enums.Sexo;

@Component
public class SexoModelAssembler extends RepresentationModelAssemblerSupport<Sexo, SexoModel>{
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	public SexoModelAssembler() {
		super(SexoController.class, SexoModel.class);
	}

	@Override
	public SexoModel toModel(Sexo sexo) {
		SexoModel sexoModel = createModelWithId(sexo.getId(),	sexo);
		modelMapper.map(sexo, sexoModel);
		
		sexoModel.add(pvasLinks.linkToSexos("sexos"));

		return sexoModel;
	}

	@Override
	public CollectionModel<SexoModel> toCollectionModel(Iterable<? extends Sexo> entities) {
		return super.toCollectionModel(entities)
						.add(linkTo(SexoController.class).withSelfRel());
	}
}
