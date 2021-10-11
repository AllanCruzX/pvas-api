package com.ikesocial.pvas.api.client;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.ikesocial.pvas.api.client.dto.EnderecoDto;
import com.ikesocial.pvas.core.client.ClientProperties;

@Service
public class EnderecoClient {
	
	@Autowired
	private ClientProperties  clientProperties;
	
	@Autowired
	RestTemplate restTemplate;
	
	public EnderecoDto buscarNoViaCep (String cep) {
		
		//RestTemplate restTemplate = new RestTemplate();
		
		URI resourceUri = URI.create(clientProperties.getViacep().getUrl() + cep +clientProperties.getViacep().getPath());
		
		EnderecoDto endereco = restTemplate.getForObject(resourceUri, EnderecoDto.class);
		
		return endereco;
		
	}

}
