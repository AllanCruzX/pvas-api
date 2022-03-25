package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.ProfissionalController;
import com.ikesocial.pvas.api.model.output.ProfissionalModel;
import com.ikesocial.pvas.core.security.PvasSecurity;
import com.ikesocial.pvas.domain.model.Profissional;

@Component
public class ProfissionalModelAssembler
		extends RepresentationModelAssemblerSupport<Profissional, ProfissionalModel> {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private PvasLinks pvasLinks;
	
	@Autowired
	private PvasSecurity pvasSecurity;

	public ProfissionalModelAssembler() {
		super(ProfissionalController.class, ProfissionalModel.class);
	}

	@Override
	public ProfissionalModel toModel(Profissional profissional) {

		ProfissionalModel profissionalModel = modelMapper.map(profissional, ProfissionalModel.class);
		
		if(pvasSecurity.podeConsultarProfissionais()) {
			
			profissionalModel.add(pvasLinks.linkToProfissionais());
			
		}

		profissionalModel.add(pvasLinks.linkToProfissional(profissionalModel.getCodigo()));


		profissionalModel.getSexo().add(pvasLinks.linkToSexo(profissionalModel.getSexo().getId()));

		profissionalModel.getEstadoCivil()
				.add(pvasLinks.linkToEstadoCivil(profissionalModel.getEstadoCivil().getId()));
		
		if(profissionalModel.getCurriculo() != null) {
			
			profissionalModel.getCurriculo().add(pvasLinks.linkToCurriculo(profissionalModel.getCurriculo().getId()));
			
			profissionalModel.getCurriculo().getIdiomas().forEach(item -> {
			item.add(pvasLinks.linkToIdioma(item.getId()));
		});

			profissionalModel.getCurriculo().getIdiomas().forEach(item -> {
			item.add(pvasLinks.linkToIdiomas("idiomas"));
		});

			profissionalModel.getCurriculo().getEspecializacoes().forEach(item -> {
			item.add(pvasLinks.linkToEspecializacao(item.getId()));
		});

			profissionalModel.getCurriculo().getEspecializacoes().forEach(item -> {
			item.add(pvasLinks.linkToEspecializacoes("especializacoes"));
		});

			profissionalModel.getCurriculo().getSubEspecialidades().forEach(item -> {
			item.add(pvasLinks.linkToSubEspecialidade(item.getId()));
		});

			profissionalModel.getCurriculo().getSubEspecialidades().forEach(item -> {
			item.add(pvasLinks.linkToSubEspecialidades(item.getEspecialidade().getId(),"sub-especialidades"));
		});
		
		
			profissionalModel.getCurriculo().getProfissoes().forEach(item -> {
			item.add(pvasLinks.linkToProfissao(item.getId()));
		});

			profissionalModel.getCurriculo().getProfissoes().forEach(item -> {
			item.add(pvasLinks.linkToProfissoes( "Profissoes"));
		});

			profissionalModel.getCurriculo().getCusos().forEach(item -> {
			item.add(pvasLinks.linkToCurso(item.getId()));
		});

			profissionalModel.getCurriculo().getCusos().forEach(item -> {
			item.add(pvasLinks.linkToCursosDoCurriculo(profissionalModel.getCurriculo().getId(), "cursos"));
		});

			profissionalModel.getCurriculo().getExperienciasProfissionais().forEach(item -> {
			item.add(pvasLinks.linkToExperienciaProfissional(item.getId()));
		});

			profissionalModel.getCurriculo().getExperienciasProfissionais().forEach(item -> {
			item.add(pvasLinks.linkToExperienciaProfissionalDoCurriculo(profissionalModel.getCurriculo().getId(),
					"experiencias-profissionais"));
		});
	}


		if (profissional.ativacaoPermitida()) {
			profissionalModel
					.add(pvasLinks.linkToProfissionalAtivar(profissionalModel.getCodigo(), "ativar"));
		}

		if (profissional.inativacaoPermitida()) {
			profissionalModel
					.add(pvasLinks.linkToProfissionalInativar(profissionalModel.getCodigo(), "inativar"));
		}

		profissionalModel.add(pvasLinks.linkToFotoDoProfissional(profissionalModel.getCodigo(), "foto"));

		return profissionalModel;

	}

	public List<ProfissionalModel> toCollectionModel(List<Profissional> assistentesSociais) {
		return assistentesSociais.stream().map(assistenteSocial -> toModel(assistenteSocial))
				.collect(Collectors.toList());
	}

}
