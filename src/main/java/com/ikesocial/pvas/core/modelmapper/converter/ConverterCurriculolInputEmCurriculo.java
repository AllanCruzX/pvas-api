package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.input.CurriculoInput;
import com.ikesocial.pvas.domain.model.Curriculo;

public class ConverterCurriculolInputEmCurriculo implements  Converter <CurriculoInput, Curriculo>{

	@Override
	public Curriculo convert(MappingContext<CurriculoInput, Curriculo> context) {
		
		if (context.getSource() == null) {
			return null;
		}
		
				Curriculo curriculo = new CurriculoInputEmCurriculoBuilder()
							.comProffisional(context.getSource().getProfissional().getCodigo())
							.comIdiomas(context.getSource().getIdiomas())
							.comEspecializacao(context.getSource().getEspecializacoes())
							.comSubEspecialidade(context.getSource().getSubEspecialidades())
							.comProfissao(context.getSource().getProfissoes())
							.comCurso(context.getSource().getCursos())
							.comExperienciaProfissional(context.getSource().getExperienciasProfissionais())
							.construir();
				
				return curriculo;
			
	}

}
