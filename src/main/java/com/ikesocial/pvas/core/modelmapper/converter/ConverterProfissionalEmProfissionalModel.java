package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.builder.ProfissionalModelBuilder;
import com.ikesocial.pvas.api.model.output.ProfissionalModel;
import com.ikesocial.pvas.domain.model.Profissional;

public  class ConverterProfissionalEmProfissionalModel implements Converter <Profissional, ProfissionalModel> {

	@Override
	public ProfissionalModel convert(MappingContext<Profissional, ProfissionalModel> context) {
		
		if (context.getSource() == null) {
			return null;
		}

		ProfissionalModel profissionalModel = new ProfissionalModelBuilder()
															.comCodigo(context.getSource().getCodigo())
															.comNome(context.getSource().getNome())
															.comNomeMae(context.getSource().getNomeMae())
															.comDataNascimento(context.getSource().getDataNascimento())
															.comSexo(context.getSource().getSexo())
															.comEstadoCivil(context.getSource().getEstadoCivil())
															.comPne(context.getSource().getPne())
															.comContatos(context.getSource().getContatos())
															.comDocumentos(context.getSource().getDocumentos())
															.comEndereco(context.getSource().getEnderecos())
															.comCurriculo(context.getSource().getCurriculo())
															.ativoOuInativo(context.getSource().getAtivo())
															.construir();
	
		return profissionalModel;
	}

	
	
}
