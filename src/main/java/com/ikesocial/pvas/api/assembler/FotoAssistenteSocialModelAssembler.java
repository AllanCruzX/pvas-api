package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.ProfissionalFotoController;
import com.ikesocial.pvas.api.model.output.FotoAssistenteSocialModel;
import com.ikesocial.pvas.domain.model.FotoPessoa;

@Component
public class FotoAssistenteSocialModelAssembler extends RepresentationModelAssemblerSupport<FotoPessoa , FotoAssistenteSocialModel> {
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	
	public FotoAssistenteSocialModelAssembler() {
        super(ProfissionalFotoController.class, FotoAssistenteSocialModel.class);
    }
	
	public FotoAssistenteSocialModel toModel(FotoPessoa foto) {
		
		FotoAssistenteSocialModel fotoAssistenteSocialModel = modelMapper.map(foto, FotoAssistenteSocialModel.class);
		
			fotoAssistenteSocialModel.add(pvasLinks.linkToFotoDoProfissional(foto.getPessoa().getCodigo(), "foto"));
		
		return fotoAssistenteSocialModel;
	}

}
