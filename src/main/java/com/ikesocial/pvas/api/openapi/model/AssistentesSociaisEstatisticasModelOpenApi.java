package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.AssistenteSocialEstatisticaModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("AssistentesSociaisEstatisticasModel")
@Data
public class AssistentesSociaisEstatisticasModelOpenApi {

	private AssistentesSociaisEstatisticasEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("AssistentesSociaisEstatisticasEmbeddedModel")
	@Data
	public class AssistentesSociaisEstatisticasEmbeddedModelOpenApi {

		private List<AssistenteSocialEstatisticaModel> AssistentesSociaisEstatisticas;

	}

}
