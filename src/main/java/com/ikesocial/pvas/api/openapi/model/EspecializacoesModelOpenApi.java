package com.ikesocial.pvas.api.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.ikesocial.pvas.api.model.output.EspecializacaoModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;

@ApiModel("EspecializacoesModel")
@Data
public class EspecializacoesModelOpenApi {

    private  EspecializacoesEmbeddedModelOpenApi _embedded;
    private Links _links;
    
    @ApiModel("EspecializacoesEmbeddedModel")
    @Data
    public class  EspecializacoesEmbeddedModelOpenApi {
        
        private List<EspecializacaoModel> especializacoes;
        
    }
}
