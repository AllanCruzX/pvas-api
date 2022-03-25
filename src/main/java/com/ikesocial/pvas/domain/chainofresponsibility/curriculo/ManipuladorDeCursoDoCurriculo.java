package com.ikesocial.pvas.domain.chainofresponsibility.curriculo;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.service.CursoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeCursoDoCurriculo extends ManipuladorDeCurriculoBase {

	@Autowired
	private CursoService cursoService;

	@Override
	public boolean tratar(Curriculo curriculo) {

		if (curriculo.temCurso()) {

			Set<Curso> cursos = curriculo.getCursos().stream()
					.map(curso -> preparaCurso(curso, curriculo))
					.collect(Collectors.toSet());

			curriculo.setCursos(cursos);
		}

		return tratarProximo(curriculo);
	}

	private Curso preparaCurso(Curso curso,Curriculo curriculo) {
		log.info("C=ManipuladorDeCursoDoCurriculo, M=preparaCurso, preparando curso");

		if (!curriculo.isNovo() && !curso.isNovo()) {
			cursoService.existeCursoParaOCurriculo(curriculo.getId(), curso.getId());
		} 
		
		if(!curso.isNovo()) {
		Curso cursoBuscado = cursoService.buscarOuFalhar(curso.getId());
		curso.setDataCadastro(cursoBuscado.getDataCadastro());
		}
		
		curso.setCurriculo(curriculo);

		return curso;
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SEGUNDO;
	}

}
