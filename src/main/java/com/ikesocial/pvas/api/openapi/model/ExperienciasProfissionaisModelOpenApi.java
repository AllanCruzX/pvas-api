package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("ExperienciasProfissionaisModel")
@Data
public class ExperienciasProfissionaisModelOpenApi {

	private ExperienciasProfissionaisEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("ExperienciasProfissionaisEmbeddedModel")
	@Data
	public class ExperienciasProfissionaisEmbeddedModelOpenApi {

		private List<ExperienciaProfissionalModel> experienciasProfissionais;

	}
}
