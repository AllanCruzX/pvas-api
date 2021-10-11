package com.ikesocial.pvas.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.api.controller.CursoController;
import com.ikesocial.pvas.api.model.output.CursoModel;
import com.ikesocial.pvas.domain.model.Curso;

@Component
public class CursoModelAssembler  extends RepresentationModelAssemblerSupport<Curso, CursoModel> {

	@Autowired
	private ModelMapper modelMapper;
	
	public CursoModelAssembler() {
		super(CursoController.class, CursoModel.class);
	}
	
	@Override
	public CursoModel toModel(Curso curso) {
		CursoModel cursoModel = createModelWithId(curso.getId() , curso);
		
		modelMapper.map(curso, cursoModel);
		
		cursoModel.add(linkTo(CursoController.class).withRel("cursos"));
		
		return cursoModel;
	}

	@Override
	public CollectionModel<CursoModel> toCollectionModel(Iterable<? extends Curso> entities) {
		  return super.toCollectionModel(entities)
		            .add(linkTo(CursoController.class).withSelfRel());
	}
}
