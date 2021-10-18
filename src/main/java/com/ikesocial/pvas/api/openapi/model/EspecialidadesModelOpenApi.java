package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.EspecialidadeModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("EspecialidadesModel")
@Data
public class EspecialidadesModelOpenApi {

    private  EspecialidadesEmbeddedModelOpenApi _embedded;
    private Links _links;
    
    @ApiModel("EspecialidadesEmbeddedModel")
    @Data
    public class EspecialidadesEmbeddedModelOpenApi {
        
        private List<EspecialidadeModel> especialidades;
        
    }
}
