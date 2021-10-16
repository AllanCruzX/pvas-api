package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.EspecialidadeController;
import com.ikesocial.pvas.api.model.output.EspecialidadeModel;
import com.ikesocial.pvas.domain.model.Especialidade;

@Component
public class EspecialidadeModelAssembler
		extends RepresentationModelAssemblerSupport<Especialidade, EspecialidadeModel> {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;

	public EspecialidadeModelAssembler() {
		super(EspecialidadeController.class, EspecialidadeModel.class);
	}

	@Override
	public EspecialidadeModel toModel(Especialidade especialidade) {
		EspecialidadeModel especialidadeModel = createModelWithId(especialidade.getId(), especialidade);
		modelMapper.map(especialidade, especialidadeModel);

		especialidadeModel.add(pvasLinks.linkToEspecialidades("especialidades"));

		return especialidadeModel;
	}

	
	@Override
	public CollectionModel<EspecialidadeModel> toCollectionModel(Iterable<? extends Especialidade> entities) {
		return super.toCollectionModel(entities)
							.add(linkTo(EspecialidadeController.class).withSelfRel());
	}

}
