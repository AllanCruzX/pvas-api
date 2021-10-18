package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("SubEspecialidadesModel")
@Data
public class SubEspecialidadesModelOpenApi {

	private SubEspecialidadesEmbeddedModelOpenApi _embedded;
	private Links _links;

	@ApiModel("SubEspecialidadesEmbeddedModel")
	@Data
	public class SubEspecialidadesEmbeddedModelOpenApi {

		private List<SubEspecialidadeModel> subEspecialidades;

	}
}
