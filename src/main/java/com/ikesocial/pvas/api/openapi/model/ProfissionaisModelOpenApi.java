package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.ProfissionalResumoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@ApiModel("ProfissionaisModel")
@Setter
@Getter
public class ProfissionaisModelOpenApi  {
	
	private  ProfissionaisEmbeddedModelOpenApi _embedded;
	private Links _links;
	private PageModelOpenApi page;

	@ApiModel(" ProfissionaisEmbeddedModel")
	@Data
	public class  ProfissionaisEmbeddedModelOpenApi {
		
		private List<ProfissionalResumoModel> profissionais;
		
	}

}
