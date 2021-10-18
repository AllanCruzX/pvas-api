package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.IdiomaModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("IdiomasModel")
@Data
public class IdiomasModelOpenApi {

	private IdiomasEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("IdiomasEmbeddedModel")
	@Data
	public class IdiomasEmbeddedModelOpenApi {

		private List<IdiomaModel> idiomas;

	}
}
