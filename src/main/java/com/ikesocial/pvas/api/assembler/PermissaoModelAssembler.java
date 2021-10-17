package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.RepresentationModelAssembler;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.model.output.PermissaoModel;
import com.ikesocial.pvas.domain.model.Permissao;

@Component
public class PermissaoModelAssembler 
        implements RepresentationModelAssembler<Permissao, PermissaoModel> {

    @Autowired
    private ModelMapper modelMapper;
    
    @Autowired
	private PvasLinks pvasLinks;

    @Override
    public PermissaoModel toModel(Permissao permissao) {
        PermissaoModel permissaoModel = modelMapper.map(permissao, PermissaoModel.class);
        return permissaoModel;
    }
    
    @Override
    public CollectionModel<PermissaoModel> toCollectionModel(Iterable<? extends Permissao> entities) {
        return RepresentationModelAssembler.super.toCollectionModel(entities)
                .add(pvasLinks.linkToPermissoes());
    }   
}
