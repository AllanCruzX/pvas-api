package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.EstadoCivilModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("EstadosCivisModel")
@Data
public class EstadosCivisModelOpenApi {

	private EstadosCivisEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("EstadosCivisEmbeddedModel")
	@Data
	public class EstadosCivisEmbeddedModelOpenApi {

		private List<EstadoCivilModel> estadosCivis;

	}
}
