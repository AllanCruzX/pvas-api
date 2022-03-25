package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.builder.CurriculoModelBuilder;
import com.ikesocial.pvas.api.model.output.CurriculoModel;
import com.ikesocial.pvas.domain.model.Curriculo;

public  class ConverterCurriculoEmCurriculoModel implements Converter <Curriculo, CurriculoModel> {

	@Override
	public CurriculoModel convert(MappingContext<Curriculo, CurriculoModel> context) {
		
		if (context.getSource() == null) {
			return null;
		}
		
		CurriculoModel CurriculoModel = new CurriculoModelBuilder()
					.comId(context.getSource().getId())
					.comEspecializacoes(context.getSource().getEspecializacoes())
					.comSubEspecialidade(context.getSource().getSubEspecialidades())
					.comIdiomas(context.getSource().getIdiomas())
					.comProfissoes(context.getSource().getProfissoes())
					.comCursos(context.getSource().getCursos())
					.comExperienciasProfissionais(context.getSource().getExperieciasProfissionais())
					.construir();
	
		return CurriculoModel;
	}

	
	
}
