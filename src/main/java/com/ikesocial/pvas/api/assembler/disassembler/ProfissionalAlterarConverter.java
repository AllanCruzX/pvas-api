package com.ikesocial.pvas.api.assembler.disassembler;

import com.ikesocial.pvas.api.model.input.ProfissionalAlterarInput;
import com.ikesocial.pvas.core.modelmapper.converter.ProfissionalInputEmProfissionalBuilder;
import com.ikesocial.pvas.domain.model.Profissional;


public abstract class ProfissionalAlterarConverter {
	
	public static Profissional copyToDomainObject(ProfissionalAlterarInput profissionalAlterarInput, Profissional assistenteSocialAtual) {
		
		return  new ProfissionalInputEmProfissionalBuilder()
		.comId(assistenteSocialAtual.getId())
		.comCodigo(assistenteSocialAtual.getCodigo())
		.comSenha(assistenteSocialAtual.getSenha())
		.comNome(profissionalAlterarInput.getNome())
		.comNomeMae(profissionalAlterarInput.getNomeMae())
		.comDataNascimento(profissionalAlterarInput.getDataNascimento())
		.comSexo(profissionalAlterarInput.getSexo())
		.comEstadoCivil(profissionalAlterarInput.getEstadoCivil())
		.comPne(profissionalAlterarInput.getPne())
		.comEmail(profissionalAlterarInput.getContato().getEmail(), assistenteSocialAtual.getEmail().getId())
		.comCelular(profissionalAlterarInput.getContato().getCelular(),  assistenteSocialAtual.getCelular().getId())
		.comFacebook(profissionalAlterarInput.getContato().getFacebook(),  assistenteSocialAtual.getFacebook().getId())
		.comInstagram(profissionalAlterarInput.getContato().getInstagram(),  assistenteSocialAtual.getIstagram().getId())
		.comYoutube(profissionalAlterarInput.getContato().getYoutube(),  assistenteSocialAtual.getYoutube().getId())
		.comLinkedin(profissionalAlterarInput.getContato().getLinkedin() , assistenteSocialAtual.getLinkedin().getId())
		.comSite(profissionalAlterarInput.getContato().getSite() , assistenteSocialAtual.getSite().getId())
		.comEndereco(profissionalAlterarInput.getEndereco() , assistenteSocialAtual.getEnderecoResidencial().getId() )
		.comCpf(profissionalAlterarInput.getDocumento().getCpf() , assistenteSocialAtual.getCpf().getId())
		.comCress(profissionalAlterarInput.getDocumento().getCress(), profissionalAlterarInput.getDocumento().getEstadoCress().getId() , assistenteSocialAtual.getCarteiraProfissional().getId() )
		//.comIdiomas(profissionalAlterarInput.getIdiomas())
		//.comEspecializacao(profissionalAlterarInput.getEspecializacoes())
		//.comSubEspecialidade(profissionalAlterarInput.getSubEspecialidades())
		//.comCurso(profissionalAlterarInput.getCursos())
		//.comExperienciaProfissional(profissionalAlterarInput.getExperienciasProfissionais())
		.comGrupos(assistenteSocialAtual.getGrupos())
		.comDataCadastro(assistenteSocialAtual.getDataCadastro())
		.construir();
	}
	
}
