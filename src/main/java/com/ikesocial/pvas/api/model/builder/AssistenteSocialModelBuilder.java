package com.ikesocial.pvas.api.model.builder;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import com.ikesocial.pvas.api.model.output.CidadeModel;
import com.ikesocial.pvas.api.model.output.ContatoModel;
import com.ikesocial.pvas.api.model.output.CursoModel;
import com.ikesocial.pvas.api.model.output.DocumentoPessoaFisicaModel;
import com.ikesocial.pvas.api.model.output.EnderecoModel;
import com.ikesocial.pvas.api.model.output.EspecialidadeModel;
import com.ikesocial.pvas.api.model.output.EspecializacaoModel;
import com.ikesocial.pvas.api.model.output.EstadoCivilModel;
import com.ikesocial.pvas.api.model.output.EstadoModel;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;
import com.ikesocial.pvas.api.model.output.IdiomaModel;
import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.api.model.output.SexoModel;
import com.ikesocial.pvas.api.model.output.SubEspecialidadeModel;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;
import com.ikesocial.pvas.domain.model.enums.TipoContato;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.model.enums.TipoEndereco;

public class AssistenteSocialModelBuilder {

	private AssistenteSocialModel assistenteSocialModel;
	
	public AssistenteSocialModelBuilder() {
		this.assistenteSocialModel = new AssistenteSocialModel();
	}
	
	public AssistenteSocialModelBuilder comCodigo(String codigo) {
		assistenteSocialModel.setCodigo(codigo);
		return this;
	}

	public AssistenteSocialModelBuilder comNome(String nome) {
		assistenteSocialModel.setNome(nome);
		return this;
	}

	public AssistenteSocialModelBuilder comNomeMae(String nomeMae) {
		assistenteSocialModel.setNomeMae(nomeMae);
		return this;
	}

	public AssistenteSocialModelBuilder comDataNascimento(LocalDate dataNascimento) {
		assistenteSocialModel.setDataNascimento(dataNascimento);
		return this;
	}
	
	public AssistenteSocialModelBuilder comSexo(Sexo sexo) {
		
		assistenteSocialModel.setSexo(new SexoModel());
		assistenteSocialModel.getSexo().setId(sexo.getId());
		assistenteSocialModel.getSexo().setNome(sexo.getNome());
		
		return this;
	}
	
	public AssistenteSocialModelBuilder comEstadoCivil(EstadoCivil estadoCivil) {
		
		assistenteSocialModel.setEstadoCivil(new EstadoCivilModel());
		assistenteSocialModel.getEstadoCivil().setId(estadoCivil.getId());
		assistenteSocialModel.getEstadoCivil().setNome(estadoCivil.getNome());
		
		return this;
	}
	
	public AssistenteSocialModelBuilder comPne(Boolean pne) {
		assistenteSocialModel.setPne(pne);
		return this;
	}

	public AssistenteSocialModelBuilder comContatos(Set<Contato> contatos) {

		assistenteSocialModel.setContato(new ContatoModel());

		montaContatos(contatos);

		return this;
	}

	public AssistenteSocialModelBuilder comDocumentos(Set<Documento> documentos) {

		assistenteSocialModel.setDocumento(new DocumentoPessoaFisicaModel());

		montaDocumentos(documentos);

		return this;
	}

	public AssistenteSocialModelBuilder comEndereco(Set<Endereco> enderecos) {

		assistenteSocialModel.setEndereco(new EnderecoModel());

		montaEndereco(enderecos);

		return this;
	}

	public AssistenteSocialModelBuilder comIdiomas(Set<Idioma> idiomas) {

		if (idiomas != null && !idiomas.isEmpty()) {

			assistenteSocialModel.setIdiomas(new HashSet<IdiomaModel>());

			montaIdiomas(idiomas);
		}

		return this;
	}

	public AssistenteSocialModelBuilder comEspecializacoes(Set<Especializacao> especializacoes) {

		if (especializacoes != null && !especializacoes.isEmpty()) {

			assistenteSocialModel.setEspecializacoes(new HashSet<EspecializacaoModel>());

			montaEspecializacao(especializacoes);

		}

		return this;
	}

	
	
	public AssistenteSocialModelBuilder comSubEspecialidade(Set<SubEspecialidade> subEspecialidades) {

		if (subEspecialidades != null && !subEspecialidades.isEmpty()) {

			assistenteSocialModel.setSubEspecialidades(new HashSet<SubEspecialidadeModel>());
			montaSubEspecialidade(subEspecialidades);

		}

		return this;
	}
	
	public AssistenteSocialModelBuilder comCursos(Set<Curso> cursos) {

		if (cursos != null && !cursos.isEmpty()) {

			assistenteSocialModel.setCusos(new ArrayList<CursoModel>());
			
			montaCursos(cursos);

		}

		return this;
	}
	
	public AssistenteSocialModelBuilder comExperienciasProfissionais(Set<ExperienciaProfissional> experienciasProfissionais) {

		if (experienciasProfissionais != null && !experienciasProfissionais.isEmpty()) {
			
			assistenteSocialModel.setExperienciasProfissionais(new ArrayList<ExperienciaProfissionalModel>());
			montaExperienciasProfissionais(experienciasProfissionais);
		}
		return this;
	}
	
	public AssistenteSocialModelBuilder ativoOuInativo(Boolean ativo) {
		assistenteSocialModel.setAtivo(ativo);
		return this;
	}
	

	private void montaExperienciasProfissionais(Set<ExperienciaProfissional> experienciasProfissionais) {
		experienciasProfissionais.forEach(experienciaProfissional ->{
			ExperienciaProfissionalModel model = new ExperienciaProfissionalModel();
			
			model.setId(experienciaProfissional.getId());
			model.setNomeEmpresa( experienciaProfissional.getNomeEmpresa());
			model.setAvidade(experienciaProfissional.getAvidade());
			model.setEmpresaAtual(experienciaProfissional.getEmpresaAtual());
			model.setDataInicio(experienciaProfissional.getDataInicio());
			model.setDataFim(experienciaProfissional.getDataFim());
			
			assistenteSocialModel.getExperienciasProfissionais().add(model);
		});
	}

	private void montaCursos(Set<Curso> cursos) {
		
		
		cursos.forEach(curso ->{
			CursoModel model = new CursoModel();
			
			model.setId(curso.getId());
			model.setNome(curso.getNome());
			model.setChagaHoraria(curso.getChagaHoraria());
			
			assistenteSocialModel.getCusos().add(model);
		});
	}


	private void montaSubEspecialidade(Set<SubEspecialidade> subEspecialidades) {
		subEspecialidades.forEach(subEspecialidade -> {
			SubEspecialidadeModel model = new SubEspecialidadeModel();

			model.setId(subEspecialidade.getId());
			model.setNome(subEspecialidade.getNome());
			model.setEspecialidade(new EspecialidadeModel());
			model.getEspecialidade().setId(subEspecialidade.getEspecialidade().getId());
			model.getEspecialidade().setNome(subEspecialidade.getEspecialidade().getNome());
			
			assistenteSocialModel.getSubEspecialidades().add(model);

		});
	}

	private void montaEspecializacao(Set<Especializacao> especializacoes) {
		especializacoes.forEach(especializacao -> {
			EspecializacaoModel model = new EspecializacaoModel();

			model.setId(especializacao.getId());
			model.setNome(especializacao.getNome());

			assistenteSocialModel.getEspecializacoes().add(model);

		});
	}

	private void montaIdiomas(Set<Idioma> idiomas) {
		idiomas.forEach(idioma -> {
			IdiomaModel model = new IdiomaModel();

			model.setId(idioma.getId());
			model.setNome(idioma.getNome());

			assistenteSocialModel.getIdiomas().add(model);

		});
	}

	private void montaEndereco(Set<Endereco> enderecos) {
		enderecos.forEach(endereco -> {

			if (endereco.getTipoEndereco().equals(TipoEndereco.RESIDENCIAL)) {

				assistenteSocialModel.getEndereco().setCep(endereco.getCep());
				assistenteSocialModel.getEndereco().setLogradouro(endereco.getLogradouro());
				assistenteSocialModel.getEndereco().setBairro(endereco.getBairro());
				assistenteSocialModel.getEndereco().setNumero(endereco.getNumero());
				assistenteSocialModel.getEndereco().setComplemento(endereco.getComplemento());
				assistenteSocialModel.getEndereco().setCidade(new CidadeModel());
				assistenteSocialModel.getEndereco().getCidade().setId(endereco.getCidade().getId());
				assistenteSocialModel.getEndereco().getCidade().setNome(endereco.getCidade().getNome());
				assistenteSocialModel.getEndereco().getCidade().setEstado(new EstadoModel());
				assistenteSocialModel.getEndereco().getCidade().getEstado().setId(endereco.getCidade().getEstado().getId());
				assistenteSocialModel.getEndereco().getCidade().getEstado()
						.setNome(endereco.getCidade().getEstado().getNome());
				assistenteSocialModel.getEndereco().getCidade().getEstado()
						.setSigla(endereco.getCidade().getEstado().getSigla());
			}

		});
	}

	private void montaDocumentos(Set<Documento> documentos) {
		documentos.forEach(documento -> {

			if (documento.getTipoDocumento().equals(TipoDocumento.CPF)) {
				assistenteSocialModel.getDocumento().setCpf(documento.getCodigo());
			}

			if (documento.getTipoDocumento().equals(TipoDocumento.CARTEIRA_PROFISSIONAL)) {
				assistenteSocialModel.getDocumento().setCress(documento.getCodigo());
				assistenteSocialModel.getDocumento().setCressEstadoSigla(documento.getEstado().getSigla());
			}

		});
	}

	private void montaContatos(Set<Contato> contatos) {
		contatos.forEach(contato -> {

			if (contato.getTipoContato().equals(TipoContato.EMAIL)) {
				assistenteSocialModel.getContato().setEmail(contato.getDescricao());
			}

			if (contato.getTipoContato().equals(TipoContato.CELULAR)) {
				assistenteSocialModel.getContato().setCelular(contato.getDescricao());
			}

			if (contato.getTipoContato().equals(TipoContato.FACEBOOK)) {
				assistenteSocialModel.getContato().setFacebook(contato.getDescricao());
			}

			if (contato.getTipoContato().equals(TipoContato.INSTAGRAN)) {
				assistenteSocialModel.getContato().setInstagran(contato.getDescricao());
			}

			if (contato.getTipoContato().equals(TipoContato.YOUTUBE)) {
				assistenteSocialModel.getContato().setYoutube(contato.getDescricao());
			}

			if (contato.getTipoContato().equals(TipoContato.LINKEDIN)) {
				assistenteSocialModel.getContato().setLinkedin(contato.getDescricao());
			}

			if (contato.getTipoContato().equals(TipoContato.SITE)) {
				assistenteSocialModel.getContato().setSite(contato.getDescricao());
			}

		});
	}
	
	public AssistenteSocialModel construir() {
		return this.assistenteSocialModel;
	}

}
