package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.controller.EstatisticasController;
import com.ikesocial.pvas.api.model.output.ProfissionalEstatisticaModel;
import com.ikesocial.pvas.domain.dto.ProfissionalEstatistica;

@Component
public class ProfissionalEstatisticaModelAssembler
		extends RepresentationModelAssemblerSupport<ProfissionalEstatistica, ProfissionalEstatisticaModel> {

	@Autowired
	private ModelMapper modelMapper;

	public ProfissionalEstatisticaModelAssembler() {
		super(EstatisticasController.class, ProfissionalEstatisticaModel.class);
	}

	@Override
	public ProfissionalEstatisticaModel toModel(ProfissionalEstatistica profissionalEstatistica) {

		ProfissionalEstatisticaModel profissionalEstatisticaModel = modelMapper.map(profissionalEstatistica,
				ProfissionalEstatisticaModel.class);

		return profissionalEstatisticaModel;
	}

	@Override
	public CollectionModel<ProfissionalEstatisticaModel> toCollectionModel(
			Iterable<? extends ProfissionalEstatistica> entities) {
		return super.toCollectionModel(entities).add(linkTo(EstatisticasController.class).withSelfRel());
	}
}
