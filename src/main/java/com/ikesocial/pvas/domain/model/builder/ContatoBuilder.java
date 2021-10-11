package com.ikesocial.pvas.domain.model.builder;

import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.model.enums.TipoContato;

public class ContatoBuilder {
	
	private Contato contato;
	
	public ContatoBuilder() {
		this.contato = new Contato();
	}
	
	
	public ContatoBuilder comDescricao(String descricao) {
		contato.setDescricao(descricao);
		return this;
	}
	
	public ContatoBuilder comTipoContato(TipoContato tipoContato) {
		contato.setTipoContato(tipoContato);
		return this;
	}
	
	public ContatoBuilder comPessoaFisica(PessoaFisica pessoaFisica) {
		contato.setPessoa(new PessoaFisica());
		contato.setPessoa(pessoaFisica);
		return this;
	}
	
	public Contato construir() {
		return this.contato;
	}

}
