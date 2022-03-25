package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.input.CurriculoAlterarInput;
import com.ikesocial.pvas.domain.model.Curriculo;

public class ConverterCurriculoAlterarlInputEmCurriculo implements  Converter <CurriculoAlterarInput, Curriculo>{

	@Override
	public Curriculo convert(MappingContext<CurriculoAlterarInput, Curriculo> context) {
		
		if (context.getSource() == null) {
			return null;
		}
		
				Curriculo curriculo = new CurriculoInputEmCurriculoBuilder()
							.comId(context.getDestination().getId())
							.comProffisional(context.getSource().getProfissional().getCodigo())
							.comIdiomas(context.getSource().getIdiomas())
							.comEspecializacao(context.getSource().getEspecializacoes())
							.comSubEspecialidade(context.getSource().getSubEspecialidades())
							.comProfissao(context.getSource().getProfissoes())
							.comCursos(context.getSource().getCursos())
							.comExperienciaProfissionais(context.getSource().getExperienciasProfissionais())
							.construir();
				
				return curriculo;
			
	}

}
