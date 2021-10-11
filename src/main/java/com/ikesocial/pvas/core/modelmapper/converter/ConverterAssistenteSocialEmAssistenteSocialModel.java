package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.builder.AssistenteSocialModelBuilder;
import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.domain.model.PessoaFisica;

public  class ConverterAssistenteSocialEmAssistenteSocialModel implements Converter <PessoaFisica, AssistenteSocialModel> {

	@Override
	public AssistenteSocialModel convert(MappingContext<PessoaFisica, AssistenteSocialModel> context) {
		
		if (context.getSource() == null) {
			return null;
		}

		AssistenteSocialModel assistenteSocialModel = new AssistenteSocialModelBuilder()
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
															.comEspecializacoes(context.getSource().getEspecializacoes())
															.comSubEspecialidade(context.getSource().getSubEspecialidades())
															.comIdiomas(context.getSource().getIdiomas())
															.comCursos(context.getSource().getCursos())
															.comExperienciasProfissionais(context.getSource().getExperieciasProfissionais())
															.ativoOuInativo(context.getSource().getAtivo())
															.construir();
	
		return assistenteSocialModel;
	}

	
	
}
