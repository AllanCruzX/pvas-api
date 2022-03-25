package com.ikesocial.pvas.api.model.builder;

import java.time.LocalDate;
import java.util.Set;

import com.ikesocial.pvas.api.model.output.CidadeModel;
import com.ikesocial.pvas.api.model.output.ContatoModel;
import com.ikesocial.pvas.api.model.output.CurriculoModel;
import com.ikesocial.pvas.api.model.output.DocumentoDoProfissionalModel;
import com.ikesocial.pvas.api.model.output.EnderecoModel;
import com.ikesocial.pvas.api.model.output.EstadoCivilModel;
import com.ikesocial.pvas.api.model.output.EstadoModel;
import com.ikesocial.pvas.api.model.output.ProfissionalModel;
import com.ikesocial.pvas.api.model.output.SexoModel;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;

public class ProfissionalModelBuilder {

	private ProfissionalModel profissionalModel;

	public ProfissionalModelBuilder() {
		this.profissionalModel = new ProfissionalModel();
	}

	public ProfissionalModelBuilder comCodigo(String codigo) {
		profissionalModel.setCodigo(codigo);
		return this;
	}

	public ProfissionalModelBuilder comNome(String nome) {
		profissionalModel.setNome(nome);
		return this;
	}

	public ProfissionalModelBuilder comNomeMae(String nomeMae) {
		profissionalModel.setNomeMae(nomeMae);
		return this;
	}

	public ProfissionalModelBuilder comDataNascimento(LocalDate dataNascimento) {
		profissionalModel.setDataNascimento(dataNascimento);
		return this;
	}

	public ProfissionalModelBuilder comSexo(Sexo sexo) {

		profissionalModel.setSexo(new SexoModel());
		profissionalModel.getSexo().setId(sexo.getId());
		profissionalModel.getSexo().setNome(sexo.getNome());

		return this;
	}

	public ProfissionalModelBuilder comEstadoCivil(EstadoCivil estadoCivil) {

		profissionalModel.setEstadoCivil(new EstadoCivilModel());
		profissionalModel.getEstadoCivil().setId(estadoCivil.getId());
		profissionalModel.getEstadoCivil().setNome(estadoCivil.getNome());

		return this;
	}

	public ProfissionalModelBuilder comPne(Boolean pne) {
		profissionalModel.setPne(pne);
		return this;
	}

	public ProfissionalModelBuilder comContatos(Set<Contato> contatos) {

		profissionalModel.setContato(new ContatoModel());

		montaContatos(contatos);

		return this;
	}

	public ProfissionalModelBuilder comDocumentos(Set<Documento> documentos) {

		profissionalModel.setDocumento(new DocumentoDoProfissionalModel());

		montaDocumentos(documentos);

		return this;
	}

	public ProfissionalModelBuilder comEndereco(Set<Endereco> enderecos) {

		profissionalModel.setEndereco(new EnderecoModel());

		montaEndereco(enderecos);

		return this;
	}

	public ProfissionalModelBuilder ativoOuInativo(Boolean ativo) {
		profissionalModel.setAtivo(ativo);
		return this;
	}
	
	public ProfissionalModelBuilder comCurriculo(Curriculo curriculo) {
		
		if(curriculo != null) {
		
		CurriculoModel CurriculoModel = new CurriculoModelBuilder()
				.comId(curriculo.getId())
				.comEspecializacoes(curriculo.getEspecializacoes())
				.comSubEspecialidade(curriculo.getSubEspecialidades())
				.comIdiomas(curriculo.getIdiomas())
				.comProfissoes(curriculo.getProfissoes())
				.comCursos(curriculo.getCursos())
				.comExperienciasProfissionais(curriculo.getExperieciasProfissionais())
				.construir();
		
		profissionalModel.setCurriculo(CurriculoModel);
		
		}
		return this;
	}

	private void montaEndereco(Set<Endereco> enderecos) {
		enderecos.forEach(endereco -> {

			if (endereco.eUmEnderecoResidencial()) {

				profissionalModel.getEndereco().setCep(endereco.getCep());
				profissionalModel.getEndereco().setLogradouro(endereco.getLogradouro());
				profissionalModel.getEndereco().setBairro(endereco.getBairro());
				profissionalModel.getEndereco().setNumero(endereco.getNumero());
				profissionalModel.getEndereco().setComplemento(endereco.getComplemento());
				profissionalModel.getEndereco().setCidade(new CidadeModel());
				profissionalModel.getEndereco().getCidade().setId(endereco.getCidade().getId());
				profissionalModel.getEndereco().getCidade().setNome(endereco.getCidade().getNome());
				profissionalModel.getEndereco().getCidade().setEstado(new EstadoModel());
				profissionalModel.getEndereco().getCidade().getEstado().setId(endereco.getCidade().getEstado().getId());
				profissionalModel.getEndereco().getCidade().getEstado()
						.setNome(endereco.getCidade().getEstado().getNome());
				profissionalModel.getEndereco().getCidade().getEstado()
						.setSigla(endereco.getCidade().getEstado().getSigla());
			}

		});
	}

	private void montaDocumentos(Set<Documento> documentos) {
		documentos.forEach(documento -> {

			if (documento.eUmCpf()) {
				profissionalModel.getDocumento().setCpf(documento.getCodigo());
			}

			if (documento.eUmCress()) {
				profissionalModel.getDocumento().setCress(documento.getCodigo());
				profissionalModel.getDocumento().setCressEstadoSigla(documento.getEstado().getSigla());
			}

		});
	}

	private void montaContatos(Set<Contato> contatos) {
		contatos.forEach(contato -> {

			if (contato.eUmEmail()) {
				profissionalModel.getContato().setEmail(contato.getDescricao());
			}

			if (contato.eUmCelular()) {
				profissionalModel.getContato().setCelular(contato.getDescricao());
			}

			if (contato.eUmFacebook()) {
				profissionalModel.getContato().setFacebook(contato.getDescricao());
			}

			if (contato.eUmIstagran()) {
				profissionalModel.getContato().setInstagran(contato.getDescricao());
			}

			if (contato.eUmYoutube()) {
				profissionalModel.getContato().setYoutube(contato.getDescricao());
			}

			if (contato.eUmLinkedin()) {
				profissionalModel.getContato().setLinkedin(contato.getDescricao());
			}

			if (contato.eUmSite()) {
				profissionalModel.getContato().setSite(contato.getDescricao());
			}

		});
	}
	
	

	public ProfissionalModel construir() {
		return this.profissionalModel;
	}

}
