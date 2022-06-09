package com.ikesocial.pvas.domain.builder;

import java.util.Set;

import com.ikesocial.pvas.domain.enums.EstadoCivil;
import com.ikesocial.pvas.domain.enums.Sexo;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Profissional;

public class ProfissionalBuilder {

	private Profissional profissional;

	public ProfissionalBuilder() {
		this.profissional = new Profissional();
	}

	public ProfissionalBuilder comId(Long id) {
		profissional.setId(id);
		return this;
	}

	public ProfissionalBuilder comNome(String nome) {
		profissional.setNome(nome);
		return this;
	}
	public ProfissionalBuilder comNomeMae(String nomeMae) {
		profissional.setNomeMae(nomeMae);
		return this;
	}

	public ProfissionalBuilder comSenha(String senha) {
		profissional.setSenha(senha);
		return this;
	}
	
	public ProfissionalBuilder eCasado() {
		profissional.setEstadoCivil(EstadoCivil.CASADO);
		return this;
	}
	
	public ProfissionalBuilder sexo(Sexo sexo) {
		profissional.setSexo(sexo);
		return this;
	}

	public ProfissionalBuilder comComtatos(Set<Contato> contatos) {
		profissional.setContatos(contatos);
		return this;
	}
	
	public ProfissionalBuilder comEnderecos(Set<Endereco> enderecos) {
		profissional.setEnderecos(enderecos);
		return this;
	}
	public ProfissionalBuilder comDocumentos(Set<Documento> documentos) {
		profissional.setDocumentos(documentos);
		return this;
	}
	
	public Profissional construir() {
		return this.profissional;
	}

}
