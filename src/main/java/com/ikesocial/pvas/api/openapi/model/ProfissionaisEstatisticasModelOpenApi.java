package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.ProfissionalEstatisticaModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("ProfissionaisEstatisticasModel")
@Data
public class ProfissionaisEstatisticasModelOpenApi {

	private ProfissionaisEstatisticasEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("ProfissionaisEstatisticasEmbeddedModel")
	@Data
	public class ProfissionaisEstatisticasEmbeddedModelOpenApi {

		private List<ProfissionalEstatisticaModel> profissionaisEstatisticas;

	}

}
