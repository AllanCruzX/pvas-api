package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.service.CadastroCursoService;

@Component
public class ManipuladorDeCursoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroCursoService cursoService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if( assistenteSocial.getCursos()!= null && !assistenteSocial.getCursos().isEmpty()) {
			
			Set<Curso> cursos = assistenteSocial.getCursos()
								.stream()
								.map(curso -> cursoService.buscarOuFalhar(curso.getId()))
								.collect(Collectors.toSet());
			
			
				assistenteSocial.setCursos(cursos);
			}

		return tratarProximo(assistenteSocial);
	}

	@Override
	public Integer getPrioridade() {
		return 7;
	}

}
