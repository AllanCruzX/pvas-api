package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.controller.EstatisticasController;
import com.ikesocial.pvas.api.model.output.AssistenteSocialEstatisticaModel;
import com.ikesocial.pvas.domain.model.dto.AssistenteSocialEstatistica;

@Component
public class AssistenteSocialEstatisticaModelAssembler
		extends RepresentationModelAssemblerSupport<AssistenteSocialEstatistica, AssistenteSocialEstatisticaModel> {

	@Autowired
	private ModelMapper modelMapper;

	public AssistenteSocialEstatisticaModelAssembler() {
		super(EstatisticasController.class, AssistenteSocialEstatisticaModel.class);
	}

	@Override
	public AssistenteSocialEstatisticaModel toModel(AssistenteSocialEstatistica assistenteSocialEstatistica) {

		AssistenteSocialEstatisticaModel assistenteSocialEstatisticaModel = modelMapper.map(assistenteSocialEstatistica,
				AssistenteSocialEstatisticaModel.class);

		return assistenteSocialEstatisticaModel;
	}

	@Override
	public CollectionModel<AssistenteSocialEstatisticaModel> toCollectionModel(
			Iterable<? extends AssistenteSocialEstatistica> entities) {
		return super.toCollectionModel(entities).add(linkTo(EstatisticasController.class).withSelfRel());
	}
}
