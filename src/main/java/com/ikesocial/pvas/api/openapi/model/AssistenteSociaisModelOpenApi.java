package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@ApiModel("AssistenteSociaisModel")
@Setter
@Getter
public class AssistenteSociaisModelOpenApi  {
	
	private  AssistenteSociaisEmbeddedModelOpenApi _embedded;
	private Links _links;
	private PageModelOpenApi page;

	@ApiModel(" AssistenteSociaisEmbeddedModel")
	@Data
	public class  AssistenteSociaisEmbeddedModelOpenApi {
		
		private List<AssistenteSocialResumoModel> assistentesSociais;
		
	}

}
