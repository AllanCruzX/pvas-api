package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.ProfissaoController;
import com.ikesocial.pvas.api.model.output.ProfissaoModel;
import com.ikesocial.pvas.domain.model.Profissao;

@Component
public class ProfissaoModelAssembler extends RepresentationModelAssemblerSupport<Profissao, ProfissaoModel>{
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	public ProfissaoModelAssembler() {
		super(ProfissaoController.class, ProfissaoModel.class);
	}
	
	@Override
	public ProfissaoModel toModel(Profissao profissao) {
		ProfissaoModel profissaoModel = createModelWithId(profissao.getId(),	profissao);
		modelMapper.map(profissao, profissaoModel);
		
		profissaoModel.add(pvasLinks.linkToProfissoes("profissoes"));

		return profissaoModel;
	}

	@Override
	public CollectionModel<ProfissaoModel> toCollectionModel(Iterable<? extends Profissao> entities) {
		
		return super.toCollectionModel(entities)
						.add(linkTo(ProfissaoController.class).withSelfRel());
	}

}
