package com.ikesocial.pvas.api.assembler.disassembler;

import com.ikesocial.pvas.api.model.input.AssistenteSocialAlterarInput;
import com.ikesocial.pvas.core.modelmapper.converter.AssistenteSocialInputEmAssistenteSocialBuilder;
import com.ikesocial.pvas.domain.model.AssistenteSocial;


public abstract class AssistentesSociaisAlterarConverter {
	
	public static AssistenteSocial copyToDomainObject(AssistenteSocialAlterarInput assistenteSocialAlterarInput, AssistenteSocial assistenteSocialAtual) {
		
		return  new AssistenteSocialInputEmAssistenteSocialBuilder()
		.comId(assistenteSocialAtual.getId())
		.comCodigo(assistenteSocialAtual.getCodigo())
		.comSenha(assistenteSocialAtual.getSenha())
		.comNome(assistenteSocialAlterarInput.getNome())
		.comNomeMae(assistenteSocialAlterarInput.getNomeMae())
		.comDataNascimento(assistenteSocialAlterarInput.getDataNascimento())
		.comSexo(assistenteSocialAlterarInput.getSexo())
		.comEstadoCivil(assistenteSocialAlterarInput.getEstadoCivil())
		.comPne(assistenteSocialAlterarInput.getPne())
		.comEmail(assistenteSocialAlterarInput.getContato().getEmail(), assistenteSocialAtual.getEmail().getId())
		.comCelular(assistenteSocialAlterarInput.getContato().getCelular(),  assistenteSocialAtual.getCelular().getId())
		.comFacebook(assistenteSocialAlterarInput.getContato().getFacebook(),  assistenteSocialAtual.getFacebook().getId())
		.comInstagram(assistenteSocialAlterarInput.getContato().getInstagram(),  assistenteSocialAtual.getIstagram().getId())
		.comYoutube(assistenteSocialAlterarInput.getContato().getYoutube(),  assistenteSocialAtual.getYoutube().getId())
		.comLinkedin(assistenteSocialAlterarInput.getContato().getLinkedin() , assistenteSocialAtual.getLinkedin().getId())
		.comSite(assistenteSocialAlterarInput.getContato().getSite() , assistenteSocialAtual.getSite().getId())
		.comEndereco(assistenteSocialAlterarInput.getEndereco() , assistenteSocialAtual.getEnderecoResidencial().getId() )
		.comCpf(assistenteSocialAlterarInput.getDocumento().getCpf() , assistenteSocialAtual.getCpf().getId())
		.comCress(assistenteSocialAlterarInput.getDocumento().getCress(), assistenteSocialAlterarInput.getDocumento().getEstadoCress().getId() , assistenteSocialAtual.getCarteiraProfissional().getId() )
		.comIdiomas(assistenteSocialAlterarInput.getIdiomas())
		.comEspecializacao(assistenteSocialAlterarInput.getEspecializacoes())
		.comSubEspecialidade(assistenteSocialAlterarInput.getSubEspecialidades())
		.comCurso(assistenteSocialAlterarInput.getCursos())
		.comExperienciaProfissional(assistenteSocialAlterarInput.getExperienciasProfissionais())
		.comGrupos(assistenteSocialAtual.getGrupos())
		.comDataCadastro(assistenteSocialAtual.getDataCadastro())
		.construir();
	}
	
}
