package com.ikesocial.pvas.core.modelmapper.converter;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.Set;

import org.springframework.util.StringUtils;

import com.ikesocial.pvas.api.model.input.CursoIdInput;
import com.ikesocial.pvas.api.model.input.EnderecoInput;
import com.ikesocial.pvas.api.model.input.EspecializacaoIdInput;
import com.ikesocial.pvas.api.model.input.EstadoCivilIdInput;
import com.ikesocial.pvas.api.model.input.ExperienciaProfissionalIdInput;
import com.ikesocial.pvas.api.model.input.IdiomaIdInput;
import com.ikesocial.pvas.api.model.input.SexoIdInput;
import com.ikesocial.pvas.api.model.input.SubEspecialidadeIdInput;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;
import com.ikesocial.pvas.domain.model.enums.TipoContato;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;

public class AssistenteSocialInputEmAssistenteSocialBuilder {

	private AssistenteSocial assistenteSocial;

	public AssistenteSocialInputEmAssistenteSocialBuilder() {
		assistenteSocial = new AssistenteSocial();
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comId(Long id) {
		assistenteSocial.setId(id);
		return this;
	}
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comCodigo(String codigo) {
		assistenteSocial.setCodigo(codigo);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comNome(String nome) {
		assistenteSocial.setNome(nome);
		return this;
	}
	public AssistenteSocialInputEmAssistenteSocialBuilder comSenha(String senha) {
		assistenteSocial.setSenha(senha);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comNomeMae(String nomeMae) {
		assistenteSocial.setNomeMae(nomeMae);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comDataNascimento(LocalDate dataNascimento) {
		assistenteSocial.setDataNascimento(dataNascimento);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comSexo(SexoIdInput sexo) {
			assistenteSocial.setSexo(Sexo.getById(sexo.getId()));
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comEstadoCivil(EstadoCivilIdInput estadoCivil) {
		assistenteSocial.setEstadoCivil(EstadoCivil.getById(estadoCivil.getId()));
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comPne(Boolean pne) {
		assistenteSocial.setPne(pne);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comEmail(String email) {
		preparaContato(email, TipoContato.EMAIL);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comCelular(String celular) {
		preparaContato(celular, TipoContato.CELULAR);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comFacebook(String faceBook) {
		preparaContato(faceBook, TipoContato.FACEBOOK);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comInstagram(String instagram) {
		preparaContato(instagram, TipoContato.INSTAGRAN);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comYoutube(String youtube) {
		preparaContato(youtube, TipoContato.YOUTUBE);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comLinkedin(String linkedin) {
		preparaContato(linkedin, TipoContato.LINKEDIN);
		return this;
	}
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comSite(String site) {
		preparaContato(site, TipoContato.SITE );
		return this;
	}
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comEmail(String email , Long id) {
		preparaContato(email, TipoContato.EMAIL ,id);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comCelular(String celular, Long id) {
		preparaContato(celular, TipoContato.CELULAR, id);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comFacebook(String faceBook, Long id) {
		preparaContato(faceBook, TipoContato.FACEBOOK, id);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comInstagram(String instagram, Long id) {
		preparaContato(instagram, TipoContato.INSTAGRAN, id);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comYoutube(String youtube, Long id) {
		preparaContato(youtube, TipoContato.YOUTUBE, id);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comLinkedin(String linkedin, Long id) {
		preparaContato(linkedin, TipoContato.LINKEDIN, id);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comSite(String site, Long id) {
		preparaContato(site, TipoContato.SITE , id);
		return this;
	}

	private void preparaContato(String descricao, TipoContato tipo) {

		if (StringUtils.hasText(descricao) ) {

			Contato contato = new Contato();
			contato.setTipoContato(tipo);
			contato.setDescricao(descricao);
			assistenteSocial.getContatos().add(contato);
			
		}

	}
	
	private void preparaContato(String descricao, TipoContato tipo , Long id) {

		if (StringUtils.hasText(descricao) && id != null ) {

			Contato contato = new Contato();
			contato.setId(id);
			contato.setTipoContato(tipo);
			contato.setDescricao(descricao);
			assistenteSocial.getContatos().add(contato);
			
		}

	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comEndereco(EnderecoInput enderecoInput) {

		montaEndereco(enderecoInput , null);

		return this;
	}
	
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comEndereco(EnderecoInput enderecoInput , Long id) {

		montaEndereco(enderecoInput, id);

		return this;
	}

	private void montaEndereco(EnderecoInput enderecoInput , Long id) {
		Endereco endereco = new Endereco();
		
		if(id != null) {
			endereco.setId(id);
		}
		endereco.setCep(enderecoInput.getCep());
		endereco.setLogradouro(enderecoInput.getLogradouro());
		endereco.setBairro(enderecoInput.getBairro());
		endereco.setNumero(enderecoInput.getNumero());
		endereco.setComplemento(enderecoInput.getComplemento());
		endereco.setCidade(new Cidade());
		endereco.getCidade().setId(enderecoInput.getCidade().getId());

		assistenteSocial.getEnderecos().add(endereco);
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comCpf(String cpf) {

		Documento documentoCpf = preparaDocumento(cpf, TipoDocumento.CPF, null);
		assistenteSocial.getDocumentos().add(documentoCpf);

		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comCress(String cress, Long estadoId) {

		Documento documentoCress = preparaDocumento(cress, TipoDocumento.CARTEIRA_PROFISSIONAL , null);
		documentoCress.setEstado(new Estado());
		documentoCress.getEstado().setId(estadoId);
		assistenteSocial.getDocumentos().add(documentoCress);

		return this;
	}

	private Documento preparaDocumento(String codigo, TipoDocumento tipo , Long id ) {

		Documento documento = new Documento();
		if(id != null) {
			documento.setId(id);
		}
		documento.setCodigo(codigo);
		documento.setTipoDocumento(tipo);
		
		return documento;

	}
	
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comCpf(String cpf , Long id) {

		Documento documentoCpf = preparaDocumento(cpf, TipoDocumento.CPF , id);
		assistenteSocial.getDocumentos().add(documentoCpf);

		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comCress(String cress, Long estadoId, Long id) {

		Documento documentoCress = preparaDocumento(cress, TipoDocumento.CARTEIRA_PROFISSIONAL, id);
		documentoCress.setEstado(new Estado());
		documentoCress.getEstado().setId(estadoId);
		assistenteSocial.getDocumentos().add(documentoCress);

		return this;
	}
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comGrupos(Set<Grupo> gupos) {

		if (!gupos.isEmpty()) {
						
				assistenteSocial.setGrupos(gupos);
		}
		

		return this;

	}
	
	public AssistenteSocialInputEmAssistenteSocialBuilder comDataCadastro(OffsetDateTime data) {
		assistenteSocial.setDataCadastro(data);
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comIdiomas(Set<IdiomaIdInput> idiomas) {

		if (!idiomas.isEmpty()) {

			assistenteSocial.setIdiomas(new HashSet<Idioma>());

			idiomas.forEach(i -> {
				Idioma idioma = new Idioma();
				idioma.setId(i.getId());
				
						
				assistenteSocial.getIdiomas().add(idioma);
			});

		}

		return this;

	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comEspecializacao(Set<EspecializacaoIdInput> especializacoes) {

		if (!especializacoes.isEmpty()) {

			assistenteSocial.setEspecializacoes(new HashSet<Especializacao>());

			especializacoes.forEach(e -> {
				Especializacao especializacao = new Especializacao();
				especializacao.setId(e.getId());

				assistenteSocial.getEspecializacoes().add(especializacao);
			});

		}

		return this;

	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comSubEspecialidade(Set<SubEspecialidadeIdInput> subEspecialidades) {

		if (!subEspecialidades.isEmpty()) {

			assistenteSocial.setSubEspecialidades(new HashSet<SubEspecialidade>());

			subEspecialidades.forEach(s -> {
				SubEspecialidade subEspecialidade = new SubEspecialidade();
				subEspecialidade.setId(s.getId());

				assistenteSocial.getSubEspecialidades().add(subEspecialidade);

			});

		}

		return this;

	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comCurso(Set<CursoIdInput> cursos) {

		if (!cursos.isEmpty()) {

			assistenteSocial.setCursos(new HashSet<Curso>());

			cursos.forEach(c -> {

				Curso curso = new Curso();
				curso.setId(c.getId());

				assistenteSocial.getCursos().add(curso);

			});

		}
		return this;
	}

	public AssistenteSocialInputEmAssistenteSocialBuilder comExperienciaProfissional(
			Set<ExperienciaProfissionalIdInput> experienciasProfissionais) {

		if (!experienciasProfissionais.isEmpty()) {
			assistenteSocial.setExperieciasProfissionais(new HashSet<ExperienciaProfissional>());

			experienciasProfissionais.forEach(e -> {
				ExperienciaProfissional experienciaProfissional = new ExperienciaProfissional();
				experienciaProfissional.setId(e.getId());

				assistenteSocial.getExperieciasProfissionais().add(experienciaProfissional);

			});
		}
		return this;
	}

	public AssistenteSocial construir() {
		return this.assistenteSocial;
	}

}
