package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.GrupoController;
import com.ikesocial.pvas.api.model.output.GrupoModel;
import com.ikesocial.pvas.domain.model.Grupo;

@Component
public class GrupoModelAssembler 
		extends RepresentationModelAssemblerSupport<Grupo, GrupoModel> {

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	public GrupoModelAssembler() {
		super(GrupoController.class, GrupoModel.class);
	}
	
	@Override
	public GrupoModel toModel(Grupo grupo) {
		GrupoModel grupoModel = createModelWithId(grupo.getId(), grupo);
		modelMapper.map(grupo, grupoModel);
		
		grupoModel.add(pvasLinks.linkToGrupos("grupos"));
		
		grupoModel.add(pvasLinks.linkToGrupoPermissoes(grupo.getId(), "permissoes"));
		
		return grupoModel;
	}
	
	@Override
	public CollectionModel<GrupoModel> toCollectionModel(Iterable<? extends Grupo> entities) {
		return super.toCollectionModel(entities)
				.add(pvasLinks.linkToGrupos());
	}
	
}
