package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.CursoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("CursosModel")
@Data
public class CursosModelOpenApi {

    private  CursosEmbeddedModelOpenApi _embedded;
    private Links _links;
    
    @ApiModel("CursosEmbeddedModel")
    @Data
    public class  CursosEmbeddedModelOpenApi {
        
        private List<CursoModel> cursos;
        
    }
}
