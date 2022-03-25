package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.CurriculoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("CurriculosModel")
@Data
public class CurriculosModelOpenApi {

    private  CurriculosEmbeddedModelOpenApi _embedded;
    private Links _links;
    
    @ApiModel("CurriculosEmbeddedModel")
    @Data
    public class  CurriculosEmbeddedModelOpenApi {
        
        private List<CurriculoModel> curriculos;
        
    }
}
