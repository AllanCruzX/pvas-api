package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.input.AssistenteSocialInput;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

public class ConverterAssistenteSocialInputEmAssistenteSocial implements  Converter <AssistenteSocialInput, AssistenteSocial>{
	
	

	@Override
	public AssistenteSocial convert(MappingContext<AssistenteSocialInput, AssistenteSocial> context) {
		
		if (context.getSource() == null) {
			return null;
		}
		
			AssistenteSocial assistenteSocial = new AssistenteSocialInputEmAssistenteSocialBuilder()
					.comNome(context.getSource().getNome())
					.comSenha(context.getSource().getSenha())
					.comNomeMae(context.getSource().getNomeMae())
					.comDataNascimento(context.getSource().getDataNascimento())
					.comSexo(context.getSource().getSexo())
					.comEstadoCivil(context.getSource().getEstadoCivil())
					.comPne(context.getSource().getPne())
					.comEmail(context.getSource().getContato().getEmail())
					.comCelular(context.getSource().getContato().getCelular())
					.comFacebook(context.getSource().getContato().getFacebook())
					.comInstagram(context.getSource().getContato().getInstagram())
					.comYoutube(context.getSource().getContato().getYoutube())
					.comLinkedin(context.getSource().getContato().getLinkedin())
					.comSite(context.getSource().getContato().getSite())
					.comEndereco(context.getSource().getEndereco())
					.comCpf(context.getSource().getDocumento().getCpf())
					.comCress(context.getSource().getDocumento().getCress(), context.getSource().getDocumento().getEstadoCress().getId())
					.comIdiomas(context.getSource().getIdiomas())
					.comEspecializacao(context.getSource().getEspecializacoes())
					.comSubEspecialidade(context.getSource().getSubEspecialidades())
					.comCurso(context.getSource().getCursos())
					.comExperienciaProfissional(context.getSource().getExperienciasProfissionais())
					.construir();
			return assistenteSocial;
			
	}

}
