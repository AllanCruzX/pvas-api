package com.ikesocial.pvas.api.model.output;

import java.util.List;

import org.springframework.hateoas.RepresentationModel;
import org.springframework.hateoas.server.core.Relation;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Relation(collectionRelation = "curriculos")
@Getter
@Setter
public class CurriculoModel extends RepresentationModel<CurriculoModel> {
	
	@ApiModelProperty(example = "1")
	private Long id;
	
	private List<IdiomaModel> idiomas;
	
	private List<EspecializacaoModel> especializacoes;
	
	private List<SubEspecialidadeModel> subEspecialidades;
	
	private List<ProfissaoModel> profissoes;
	
	private List<CursoModel> cusos;
	
	private List<ExperienciaProfissionalModel> experienciasProfissionais;

}
