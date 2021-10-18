package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.CidadeModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("CidadesModel")
@Data
public class CidadesModelOpenApi {

	private CidadeEmbeddedModelOpenApi _embedded;
	private Links _links;
	
	@ApiModel("CidadesEmbeddedModel")
	@Data
	public class CidadeEmbeddedModelOpenApi {
		
		private List<CidadeModel> cidades;
		
	}
	
}
