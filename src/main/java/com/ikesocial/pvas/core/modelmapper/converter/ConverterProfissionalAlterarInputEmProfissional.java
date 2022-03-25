package com.ikesocial.pvas.core.modelmapper.converter;

import org.modelmapper.Converter;
import org.modelmapper.spi.MappingContext;

import com.ikesocial.pvas.api.model.input.ProfissionalAlterarInput;
import com.ikesocial.pvas.domain.model.Profissional;

public class ConverterProfissionalAlterarInputEmProfissional implements  Converter <ProfissionalAlterarInput, Profissional>{

	@Override
	public Profissional convert(MappingContext<ProfissionalAlterarInput, Profissional> context) {
		
		if (context.getSource() == null) {
			return null;
		}
							
				Profissional profissional = new ProfissionalInputEmProfissionalBuilder()
						.comId(context.getDestination().getId())
						.comCodigo(context.getDestination().getCodigo())
						.comSenha(context.getDestination().getSenha())
						.comGrupos(context.getDestination().getGrupos())
						.comDataCadastro(context.getDestination().getDataCadastro())
						.comNome(context.getSource().getNome())
						.comNomeMae(context.getSource().getNomeMae())
						.comDataNascimento(context.getSource().getDataNascimento())
						.comSexo(context.getSource().getSexo())
						.comEstadoCivil(context.getSource().getEstadoCivil())
						.comPne(context.getSource().getPne())
						.comEmail(context.getSource().getContato().getEmail(), context.getDestination().getEmail().getId())
						.comCelular(context.getSource().getContato().getCelular(),  context.getDestination().getCelular().getId())
						.comFacebook(context.getSource().getContato().getFacebook(),  context.getDestination().getFacebook().getId())
						.comInstagram(context.getSource().getContato().getInstagram(),  context.getDestination().getIstagram().getId())
						.comYoutube(context.getSource().getContato().getYoutube(),  context.getDestination().getYoutube().getId())
						.comLinkedin(context.getSource().getContato().getLinkedin() ,  context.getDestination().getLinkedin().getId())
						.comSite(context.getSource().getContato().getSite() ,  context.getDestination().getSite().getId())
						.comEndereco(context.getSource().getEndereco() , context.getDestination().getEnderecoResidencial().getId() )
						.comCpf(context.getSource().getDocumento().getCpf() , context.getDestination().getCpf().getId())
						.comCress(context.getSource().getDocumento().getCress(), context.getSource().getDocumento().getEstadoCress().getId() , context.getDestination().getCarteiraProfissional().getId() )
						//.comIdiomas(context.getSource().getIdiomas())
						//.comEspecializacao(context.getSource().getEspecializacoes())
						//.comSubEspecialidade(context.getSource().getSubEspecialidades())
						//.comCurso(context.getSource().getCursos())
						//.comExperienciaProfissional(context.getSource().getExperienciasProfissionais())
						.construir();
				
				return profissional;
	}

}
