package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.IdiomaController;
import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.domain.model.Idioma;

@Component
public class IdiomaModelAssembler extends RepresentationModelAssemblerSupport<Idioma, IdiomaModel>{
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	public IdiomaModelAssembler() {
		super(IdiomaController.class, IdiomaModel.class);
	}
	
	@Override
	public IdiomaModel toModel(Idioma idioma) {
		IdiomaModel idiomaModel = createModelWithId(idioma.getId(),	idioma);
		modelMapper.map(idioma, idiomaModel);
		
		idiomaModel.add(pvasLinks.linkToIdiomas("idiomas"));

		return idiomaModel;
	}

	@Override
	public CollectionModel<IdiomaModel> toCollectionModel(
			Iterable<? extends Idioma> entities) {
		return super.toCollectionModel(entities)
						.add(linkTo(IdiomaController.class).withSelfRel());
	}

}
