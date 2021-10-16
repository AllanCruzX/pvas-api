package com.ikesocial.pvas.api.assembler;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.PvasLinks;
import com.ikesocial.pvas.api.controller.AssistenteSocialController;
import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Component
public class AssistenteSocialModelAssembler
		extends RepresentationModelAssemblerSupport<AssistenteSocial, AssistenteSocialModel> {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private PvasLinks pvasLinks;

	public AssistenteSocialModelAssembler() {
		super(AssistenteSocialController.class, AssistenteSocialModel.class);
	}

	@Override
	public AssistenteSocialModel toModel(AssistenteSocial assistenteSocial) {

		AssistenteSocialModel assistenteSocialModel = modelMapper.map(assistenteSocial, AssistenteSocialModel.class);

		assistenteSocialModel.add(pvasLinks.linkToAssistenteSocial(assistenteSocialModel.getCodigo()));

		assistenteSocialModel.add(pvasLinks.linkToAssistentesSociais());

		assistenteSocialModel.getSexo().add(pvasLinks.linkToSexo(assistenteSocialModel.getSexo().getId()));

		assistenteSocialModel.getEstadoCivil()
				.add(pvasLinks.linkToEstadoCivil(assistenteSocialModel.getEstadoCivil().getId()));

		assistenteSocialModel.getIdiomas().forEach(item -> {
			item.add(pvasLinks.linkToIdioma(item.getId()));
		});

		assistenteSocialModel.getIdiomas().forEach(item -> {
			item.add(pvasLinks.linkToIdiomasDoAssistenteSocial(assistenteSocialModel.getCodigo(), "idiomas"));
		});

		assistenteSocialModel.getEspecializacoes().forEach(item -> {
			item.add(pvasLinks.linkToEspecializacao(item.getId()));
		});

		assistenteSocialModel.getEspecializacoes().forEach(item -> {
			item.add(pvasLinks.linkToEspecializacoesAssistenteSocial(assistenteSocialModel.getCodigo(),
					"especializacoes"));
		});

		assistenteSocialModel.getSubEspecialidades().forEach(item -> {
			item.add(pvasLinks.linkToSubEspecialidade(item.getId()));
		});

		assistenteSocialModel.getSubEspecialidades().forEach(item -> {
			item.add(pvasLinks.linkToSubEspecialidadesAssistenteSocial(assistenteSocialModel.getCodigo(),
					"sub-especialidades"));
		});

		assistenteSocialModel.getCusos().forEach(item -> {
			item.add(pvasLinks.linkToCurso(item.getId()));
		});

		assistenteSocialModel.getCusos().forEach(item -> {
			item.add(pvasLinks.linkToCursosAssistenteSocial(assistenteSocialModel.getCodigo(), "cursos"));
		});

		assistenteSocialModel.getExperienciasProfissionais().forEach(item -> {
			item.add(pvasLinks.linkToExperienciaProfissional(item.getId()));
		});

		assistenteSocialModel.getExperienciasProfissionais().forEach(item -> {
			item.add(pvasLinks.linkToExperienciaProfissionalDaAssistenteSocial(assistenteSocialModel.getCodigo(),
					"experiencias-profissionais"));
		});

		if (assistenteSocial.ativacaoPermitida()) {
			assistenteSocialModel
					.add(pvasLinks.linkToAssistenteSocialAtivar(assistenteSocialModel.getCodigo(), "ativar"));
		}

		if (assistenteSocial.inativacaoPermitida()) {
			assistenteSocialModel
					.add(pvasLinks.linkToAssistenteSocialInativar(assistenteSocialModel.getCodigo(), "inativar"));
		}

		assistenteSocialModel.add(pvasLinks.linkToFotoAssistenteSocial(assistenteSocialModel.getCodigo(), "foto"));

		return assistenteSocialModel;

	}

	public List<AssistenteSocialModel> toCollectionModel(List<AssistenteSocial> assistentesSociais) {
		return assistentesSociais.stream().map(assistenteSocial -> toModel(assistenteSocial))
				.collect(Collectors.toList());
	}

}
