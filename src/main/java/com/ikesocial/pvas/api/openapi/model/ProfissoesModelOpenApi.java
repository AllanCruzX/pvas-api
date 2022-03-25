package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.ProfissaoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("ProfissoesModel")
@Data
public class ProfissoesModelOpenApi {

    private ProfissoesEmbeddedModelOpenApi _embedded;
    private Links _links;
    
    @ApiModel("ProfissoesEmbeddedModel")
    @Data
    public class  ProfissoesEmbeddedModelOpenApi {
        
        private List<ProfissaoModel> profissoes;
        
    }
}
