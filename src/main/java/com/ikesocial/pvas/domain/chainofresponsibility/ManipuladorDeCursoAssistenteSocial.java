package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.service.CadastroCursoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeCursoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroCursoService cursoService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		if (assistenteSocial.temCurso()) {

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

		if (!assistenteSocial.temCodigo()) {
			cursoRecuperado = montaCurso(curso, assistenteSocial, null);
			log.info("Preparando curso do id {}", curso.getId());
		} else {
			cursoRecuperado = montaCurso(curso, assistenteSocial, assistenteSocial.getCodigo());
			log.info("Preparando curso do id {}, para o assistente social do codigo {}", curso.getId() ,assistenteSocial.getCodigo());
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
