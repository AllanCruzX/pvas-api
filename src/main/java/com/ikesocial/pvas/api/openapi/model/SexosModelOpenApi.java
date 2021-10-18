package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.SexoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("SexosModel")
@Data
public class SexosModelOpenApi {

	private SexosEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("SexosEmbeddedModel")
	@Data
	public class SexosEmbeddedModelOpenApi {

		private List<SexoModel> sexos;

	}
}
