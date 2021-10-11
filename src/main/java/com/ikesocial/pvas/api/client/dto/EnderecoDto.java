package com.ikesocial.pvas.api.client.dto;

import lombok.Data;

@Data
public class EnderecoDto {
	
	private String cep;
	private String logradouro;
	private String complemento;
	private String bairro;
	private String localidade;
	private String uf;
}
