package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.CurriculoController;
import com.ikesocial.pvas.api.model.output.CurriculoModel;
import com.ikesocial.pvas.domain.model.Curriculo;

@Component
public class CurriculoModelAssembler extends RepresentationModelAssemblerSupport<Curriculo, CurriculoModel> {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private PvasLinks pvasLinks;

//	@Autowired
//	private PvasSecurity pvasSecurity;

	public CurriculoModelAssembler() {
		super(CurriculoController.class, CurriculoModel.class);
	}

	@Override
	public CurriculoModel toModel(Curriculo curriculo) {

		CurriculoModel curriculoModel = modelMapper.map(curriculo, CurriculoModel.class);

		curriculoModel.add(pvasLinks.linkToCurriculo(curriculoModel.getId()));

		curriculoModel.getIdiomas().forEach(item -> {
			item.add(pvasLinks.linkToIdioma(item.getId()));
		});

		curriculoModel.getIdiomas().forEach(item -> {
			item.add(pvasLinks.linkToIdiomas("idiomas"));
		});

		curriculoModel.getEspecializacoes().forEach(item -> {
			item.add(pvasLinks.linkToEspecializacao(item.getId()));
		});

		curriculoModel.getEspecializacoes().forEach(item -> {
			item.add(pvasLinks.linkToEspecializacoes("especializacoes"));
		});

		curriculoModel.getSubEspecialidades().forEach(item -> {
			item.add(pvasLinks.linkToSubEspecialidade(item.getId()));
		});

		curriculoModel.getSubEspecialidades().forEach(item -> {
			item.add(pvasLinks.linkToSubEspecialidades(item.getEspecialidade().getId(),"sub-especialidades"));
		});
		
		
		curriculoModel.getProfissoes().forEach(item -> {
			item.add(pvasLinks.linkToProfissao(item.getId()));
		});

		curriculoModel.getProfissoes().forEach(item -> {
			item.add(pvasLinks.linkToProfissoes( "Profissoes"));
		});

		curriculoModel.getCusos().forEach(item -> {
			item.add(pvasLinks.linkToCurso(item.getId()));
		});

		curriculoModel.getCusos().forEach(item -> {
			item.add(pvasLinks.linkToCursosDoCurriculo(curriculoModel.getId(), "cursos"));
		});

		curriculoModel.getExperienciasProfissionais().forEach(item -> {
			item.add(pvasLinks.linkToExperienciaProfissional(item.getId()));
		});

		curriculoModel.getExperienciasProfissionais().forEach(item -> {
			item.add(pvasLinks.linkToExperienciaProfissionalDoCurriculo(curriculoModel.getId(),
					"experiencias-profissionais"));
		});

		return curriculoModel;

	}

	public List<CurriculoModel> toCollectionModel(List<Curriculo> curriculos) {
		return curriculos.stream().map(curriculo -> toModel(curriculo))
				.collect(Collectors.toList());
	}

}
