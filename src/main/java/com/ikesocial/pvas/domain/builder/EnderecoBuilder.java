package com.ikesocial.pvas.domain.builder;

import com.ikesocial.pvas.domain.enums.TipoEndereco;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Profissional;

public class EnderecoBuilder {
	
	private Endereco endereco;
	
	public EnderecoBuilder() {
		this.endereco = new Endereco();
	}
	
	
	public EnderecoBuilder comId(Long id) {
		endereco.setId(id);
		return this;
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
	
	public EnderecoBuilder comPessoaFisica(Profissional profissional) {
		endereco.setPessoa(new Profissional());
		endereco.setPessoa(profissional);
		return this;
	}
	
	public Endereco construir() {
		return this.endereco;
	}

}
