package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.service.CadastroCursoService;

@Component
public class ManipuladorDeCursoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroCursoService cursoService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.getCursos() != null && !assistenteSocial.getCursos().isEmpty()) {

			Set<Curso> cursos = assistenteSocial.getCursos()
													.stream()
													.map(curso -> preparaCurso(curso, assistenteSocial))
													.collect(Collectors.toSet());

			assistenteSocial.setCursos(cursos);
		}

		return tratarProximo(assistenteSocial);
	}

	private Curso preparaCurso(Curso curso, AssistenteSocial assistenteSocial) {
		Curso cursoRecuperado = null;

		if (!StringUtils.hasText(assistenteSocial.getCodigo())) {
			cursoRecuperado = montaCurso(curso, assistenteSocial, null);
		} else {
			cursoRecuperado = montaCurso(curso, assistenteSocial, assistenteSocial.getCodigo());
		}

		return cursoRecuperado;
	}

	private Curso montaCurso(Curso curso, AssistenteSocial assistenteSocial, String codigoAssitenteSocial) {

		Curso cursoRecuperado = cursoService.buscarOuFalharCursoDisponivel(curso.getId(), codigoAssitenteSocial);
		
//		if(cursoRecuperado.getAssistenteSocial() == null) {
//			cursoRecuperado.setAssistenteSocial(assistenteSocial);
//			
//		}
		

		return cursoRecuperado;
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SETIMO;
	}

}
