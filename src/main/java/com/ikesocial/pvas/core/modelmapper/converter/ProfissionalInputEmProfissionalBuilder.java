package com.ikesocial.pvas.core.modelmapper.converter;

import java.time.LocalDate;
import java.time.OffsetDateTime;
import java.util.Set;

import org.springframework.util.StringUtils;

import com.ikesocial.pvas.api.model.input.EnderecoInput;
import com.ikesocial.pvas.api.model.input.EstadoCivilIdInput;
import com.ikesocial.pvas.api.model.input.SexoIdInput;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;
import com.ikesocial.pvas.domain.model.enums.TipoContato;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;

public class ProfissionalInputEmProfissionalBuilder {

	private Profissional profissional;

	public ProfissionalInputEmProfissionalBuilder() {
		profissional = new Profissional();
	}

	public ProfissionalInputEmProfissionalBuilder comId(Long id) {
		profissional.setId(id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comCodigo(String codigo) {
		profissional.setCodigo(codigo);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comNome(String nome) {
		profissional.setNome(nome);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comSenha(String senha) {
		profissional.setSenha(senha);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comNomeMae(String nomeMae) {
		profissional.setNomeMae(nomeMae);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comDataNascimento(LocalDate dataNascimento) {
		profissional.setDataNascimento(dataNascimento);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comSexo(SexoIdInput sexo) {
		profissional.setSexo(Sexo.getById(sexo.getId()));
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comEstadoCivil(EstadoCivilIdInput estadoCivil) {
		profissional.setEstadoCivil(EstadoCivil.getById(estadoCivil.getId()));
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comPne(Boolean pne) {
		profissional.setPne(pne);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comEmail(String email) {
		preparaContato(email, TipoContato.EMAIL);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comCelular(String celular) {
		preparaContato(celular, TipoContato.CELULAR);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comFacebook(String faceBook) {
		preparaContato(faceBook, TipoContato.FACEBOOK);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comInstagram(String instagram) {
		preparaContato(instagram, TipoContato.INSTAGRAN);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comYoutube(String youtube) {
		preparaContato(youtube, TipoContato.YOUTUBE);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comLinkedin(String linkedin) {
		preparaContato(linkedin, TipoContato.LINKEDIN);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comSite(String site) {
		preparaContato(site, TipoContato.SITE);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comEmail(String email, Long id) {
		preparaContato(email, TipoContato.EMAIL, id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comCelular(String celular, Long id) {
		preparaContato(celular, TipoContato.CELULAR, id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comFacebook(String faceBook, Long id) {
		preparaContato(faceBook, TipoContato.FACEBOOK, id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comInstagram(String instagram, Long id) {
		preparaContato(instagram, TipoContato.INSTAGRAN, id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comYoutube(String youtube, Long id) {
		preparaContato(youtube, TipoContato.YOUTUBE, id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comLinkedin(String linkedin, Long id) {
		preparaContato(linkedin, TipoContato.LINKEDIN, id);
		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comSite(String site, Long id) {
		preparaContato(site, TipoContato.SITE, id);
		return this;
	}

	private void preparaContato(String descricao, TipoContato tipo) {

		if (StringUtils.hasText(descricao)) {
			
			Contato contato = new Contato();
			adicionaContato(contato, descricao, tipo);
		}

	}

	private void preparaContato(String descricao, TipoContato tipo, Long id) {

		if (StringUtils.hasText(descricao) && id != null) {

			Contato contato = new Contato();
			contato.setId(id);
			adicionaContato(contato, descricao, tipo);

		}

	}

	private void adicionaContato(Contato contato, String descricao, TipoContato tipo) {

		contato.setTipoContato(tipo);
		contato.setDescricao(descricao);
		profissional.getContatos().add(contato);

	}

	public ProfissionalInputEmProfissionalBuilder comEndereco(EnderecoInput enderecoInput) {

		montaEndereco(enderecoInput, null);

		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comEndereco(EnderecoInput enderecoInput, Long id) {

		montaEndereco(enderecoInput, id);

		return this;
	}

	private void montaEndereco(EnderecoInput enderecoInput, Long id) {
		Endereco endereco = new Endereco();

		if (id != null) {
			endereco.setId(id);
		}
		endereco.setCep(enderecoInput.getCep());
		endereco.setLogradouro(enderecoInput.getLogradouro());
		endereco.setBairro(enderecoInput.getBairro());
		endereco.setNumero(enderecoInput.getNumero());
		endereco.setComplemento(enderecoInput.getComplemento());
		endereco.setCidade(new Cidade());
		endereco.getCidade().setId(enderecoInput.getCidade().getId());

		profissional.getEnderecos().add(endereco);
	}

	public ProfissionalInputEmProfissionalBuilder comCpf(String cpf) {

		Documento documentoCpf = preparaDocumento(cpf, TipoDocumento.CPF, null);
		profissional.getDocumentos().add(documentoCpf);

		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comCress(String cress, Long estadoId) {

		Documento documentoCress = preparaDocumento(cress, TipoDocumento.CARTEIRA_PROFISSIONAL, null);
		documentoCress.setEstado(new Estado());
		documentoCress.getEstado().setId(estadoId);
		profissional.getDocumentos().add(documentoCress);

		return this;
	}



	public ProfissionalInputEmProfissionalBuilder comCpf(String cpf, Long id) {

		Documento documentoCpf = preparaDocumento(cpf, TipoDocumento.CPF, id);
		profissional.getDocumentos().add(documentoCpf);

		return this;
	}

	public ProfissionalInputEmProfissionalBuilder comCress(String cress, Long estadoId, Long id) {

		Documento documentoCress = preparaDocumento(cress, TipoDocumento.CARTEIRA_PROFISSIONAL, id);
		documentoCress.setEstado(new Estado());
		documentoCress.getEstado().setId(estadoId);
		profissional.getDocumentos().add(documentoCress);

		return this;
	}
	
	private Documento preparaDocumento(String codigo, TipoDocumento tipo, Long id) {

		Documento documento = new Documento();
		if (id != null) {
			documento.setId(id);
		}
		documento.setCodigo(codigo);
		documento.setTipoDocumento(tipo);

		return documento;

	}

	public ProfissionalInputEmProfissionalBuilder comGrupos(Set<Grupo> gupos) {

		if (!gupos.isEmpty()) {

			profissional.setGrupos(gupos);
		}

		return this;

	}

	public ProfissionalInputEmProfissionalBuilder comDataCadastro(OffsetDateTime data) {
		profissional.setDataCadastro(data);
		return this;
	}

//	public ProfissionalInputEmProfissionalBuilder comIdiomas(Set<IdiomaIdInput> idiomas) {
//
//		if (!idiomas.isEmpty()) {
//
//			profissional.setIdiomas(new HashSet<Idioma>());
//
//			idiomas.forEach(i -> {
//				Idioma idioma = new Idioma();
//				idioma.setId(i.getId());
//				
//						
//				profissional.getIdiomas().add(idioma);
//			});
//
//		}
//
//		return this;
//
//	}

//	public ProfissionalInputEmProfissionalBuilder comEspecializacao(Set<EspecializacaoIdInput> especializacoes) {
//
//		if (!especializacoes.isEmpty()) {
//
//			profissional.setEspecializacoes(new HashSet<Especializacao>());
//
//			especializacoes.forEach(e -> {
//				Especializacao especializacao = new Especializacao();
//				especializacao.setId(e.getId());
//
//				profissional.getEspecializacoes().add(especializacao);
//			});
//
//		}
//
//		return this;
//
//	}

//	public ProfissionalInputEmProfissionalBuilder comSubEspecialidade(Set<SubEspecialidadeIdInput> subEspecialidades) {
//
//		if (!subEspecialidades.isEmpty()) {
//
//			profissional.setSubEspecialidades(new HashSet<SubEspecialidade>());
//
//			subEspecialidades.forEach(s -> {
//				SubEspecialidade subEspecialidade = new SubEspecialidade();
//				subEspecialidade.setId(s.getId());
//
//				profissional.getSubEspecialidades().add(subEspecialidade);
//
//			});
//
//		}
//
//		return this;
//
//	}

//	public ProfissionalInputEmProfissionalBuilder comCurso(Set<CursoIdInput> cursos) {
//
//		if (!cursos.isEmpty()) {
//
//			profissional.setCursos(new HashSet<Curso>());
//
//			cursos.forEach(c -> {
//
//				Curso curso = new Curso();
//				curso.setId(c.getId());
//
//				profissional.getCursos().add(curso);
//
//			});
//
//		}
//		return this;
//	}

//	public ProfissionalInputEmProfissionalBuilder comExperienciaProfissional(
//			Set<ExperienciaProfissionalIdInput> experienciasProfissionais) {
//
//		if (!experienciasProfissionais.isEmpty()) {
//			profissional.setExperieciasProfissionais(new HashSet<ExperienciaProfissional>());
//
//			experienciasProfissionais.forEach(e -> {
//				ExperienciaProfissional experienciaProfissional = new ExperienciaProfissional();
//				experienciaProfissional.setId(e.getId());
//
//				profissional.getExperieciasProfissionais().add(experienciaProfissional);
//
//			});
//		}
//		return this;
//	}

	public Profissional construir() {
		return this.profissional;
	}

}
