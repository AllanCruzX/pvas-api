package com.ikesocial.pvas.api.assembler;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.EnderecoController;
import com.ikesocial.pvas.api.model.output.EnderecoModel;
import com.ikesocial.pvas.domain.model.Endereco;

@Component
public class EnderecoModelAssembler extends RepresentationModelAssemblerSupport<Endereco, EnderecoModel> {
	
	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private PvasLinks pvasLinks;
	
	  public EnderecoModelAssembler() {
	        super(EnderecoController.class, EnderecoModel.class);
	        
	        
	    }
	  
	  @Override
	public EnderecoModel toModel(Endereco endereco) {
		  EnderecoModel enderecoModel = modelMapper.map(endereco, EnderecoModel.class);
	        
		  enderecoModel.add(pvasLinks.linkToEndereco(enderecoModel.getCep() , "endereco"));
		  
		  return enderecoModel;
	}

}
