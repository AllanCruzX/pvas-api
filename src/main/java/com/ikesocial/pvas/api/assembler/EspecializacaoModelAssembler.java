package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.model.output.EspecializacaoModel;
import com.ikesocial.pvas.domain.model.Especializacao;

@Component
public class EspecializacaoModelAssembler {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public EspecializacaoModel toModel(Especializacao especializacao) {
		return modelMapper.map(especializacao, EspecializacaoModel.class);
	}

	public List<EspecializacaoModel> toCollectionModel(List<Especializacao> especializacoes) {
		return especializacoes.stream()
				.map(especializacao -> toModel(especializacao))
				.collect(Collectors.toList());
	}

}
