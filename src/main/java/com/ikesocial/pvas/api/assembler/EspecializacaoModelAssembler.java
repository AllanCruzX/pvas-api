package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.EspecializacaoController;
import com.ikesocial.pvas.api.model.output.EspecializacaoModel;
import com.ikesocial.pvas.domain.model.Especializacao;

@Component
public class EspecializacaoModelAssembler
		extends RepresentationModelAssemblerSupport<Especializacao, EspecializacaoModel> {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;

	public EspecializacaoModelAssembler() {
		super(EspecializacaoController.class, EspecializacaoModel.class);
	}

	@Override
	public EspecializacaoModel toModel(Especializacao especializacao) {
		EspecializacaoModel especializacaoModel = createModelWithId(especializacao.getId(), especializacao);
		modelMapper.map(especializacao, especializacaoModel);

		especializacaoModel.add(pvasLinks.linkToEspecializacoes("especializacoes"));

		return especializacaoModel;
	}

	@Override
	public CollectionModel<EspecializacaoModel> toCollectionModel(Iterable<? extends Especializacao> entities) {
		return super.toCollectionModel(entities)
							.add(linkTo(EspecializacaoController.class).withSelfRel());
	}
}
