package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.SubEspecialidadeController;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.domain.model.SubEspecialidade;

@Component
public class SubEspecialidadeModelAssembler  extends RepresentationModelAssemblerSupport<SubEspecialidade, SubEspecialidadeModel> {
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	public SubEspecialidadeModelAssembler() {
		super(SubEspecialidadeController.class, SubEspecialidadeModel.class);
	}

	@Override
	public SubEspecialidadeModel toModel(SubEspecialidade subEspecialidade) {
		SubEspecialidadeModel subEspecialidadeModel = createModelWithId(subEspecialidade.getId(),	subEspecialidade);
		modelMapper.map(subEspecialidade, subEspecialidadeModel);
		
		subEspecialidadeModel.add(pvasLinks.linkToSubEspecialidades("subs-especialidades"));

		subEspecialidadeModel.getEspecialidade().add(pvasLinks.linkToEspecialidade(subEspecialidadeModel.getEspecialidade().getId()));
		
		return subEspecialidadeModel;
	}

	@Override
	public CollectionModel<SubEspecialidadeModel> toCollectionModel(Iterable<? extends SubEspecialidade> entities) {
		return super.toCollectionModel(entities)
						.add(linkTo(SubEspecialidadeController.class).withSelfRel());
	}

}
