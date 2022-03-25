package com.ikesocial.pvas.api.assembler.disassembler;

import com.ikesocial.pvas.api.model.input.CurriculoAlterarInput;
import com.ikesocial.pvas.core.modelmapper.converter.CurriculoInputEmCurriculoBuilder;
import com.ikesocial.pvas.domain.model.Curriculo;


public abstract class CurriculoAlterarConverter {
	
	public static Curriculo copyToDomainObject(CurriculoAlterarInput curriculoAlterarInput, Curriculo curriculoAtual) {
		
		return  new  CurriculoInputEmCurriculoBuilder()
				.comId(curriculoAtual.getId())
				.comProffisional(curriculoAlterarInput.getProfissional().getCodigo())
				.comIdiomas(curriculoAlterarInput.getIdiomas())
				.comEspecializacao(curriculoAlterarInput.getEspecializacoes())
				.comSubEspecialidade(curriculoAlterarInput.getSubEspecialidades())
				.comProfissao(curriculoAlterarInput.getProfissoes())
				.comCursos(curriculoAlterarInput.getCursos())
				.comExperienciaProfissionais(curriculoAlterarInput.getExperienciasProfissionais())
				.construir();
	}
	
}
