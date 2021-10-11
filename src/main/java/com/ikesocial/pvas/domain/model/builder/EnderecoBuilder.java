package com.ikesocial.pvas.domain.model.builder;

import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.model.enums.TipoEndereco;

public class EnderecoBuilder {
	
	private Endereco endereco;
	
	public EnderecoBuilder() {
		this.endereco = new Endereco();
	}
	
	
	public EnderecoBuilder comCep(String cep) {
		endereco.setCep(cep);
		return this;
	}
	
	public EnderecoBuilder comLogradouro(String logradouro) {
		endereco.setLogradouro(logradouro);
		return this;
	}
	
	public EnderecoBuilder comBairro(String bairro) {
		endereco.setBairro(bairro);
		return this;
	}
	
	public EnderecoBuilder comNumero(String numero) {
		endereco.setNumero(numero);
		return this;
	}
	
	public EnderecoBuilder comComplemento(String complemento) {
		endereco.setComplemento(complemento);
		return this;
	}
	
	public EnderecoBuilder comCidade(Cidade cidade) {
		if(cidade != null) {
		endereco.setCidade(cidade);
		}
		return this;
	}
	
	public EnderecoBuilder definirComoResidencial() {
		endereco.setTipoEndereco(TipoEndereco.RESIDENCIAL);
		return this;
	}
	
	public EnderecoBuilder definirComoComercial() {
		endereco.setTipoEndereco(TipoEndereco.COMERCIAL);
		return this;
	}
	
	public EnderecoBuilder definirComoPrincipal(boolean val) {
		endereco.setPrincipal(val);
		return this;
	}
	
	public EnderecoBuilder comPessoaFisica(PessoaFisica pessoaFisica) {
		endereco.setPessoa(new PessoaFisica());
		endereco.setPessoa(pessoaFisica);
		return this;
	}
	
	public Endereco construir() {
		return this.endereco;
	}

}
