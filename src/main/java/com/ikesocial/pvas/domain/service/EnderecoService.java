package com.ikesocial.pvas.domain.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.api.client.EnderecoClient;
import com.ikesocial.pvas.api.client.dto.EnderecoDto;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.builder.EnderecoBuilder;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;
import com.ikesocial.pvas.domain.repository.CidadeRepository;

@Service
public class EnderecoService {
	
	@Autowired
	private CidadeRepository cidadeRepository;
	
	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;
	
	@Autowired
	private EnderecoClient enderecoClient;
	
	
	public Endereco ConsultaEndereco(String cep) {
		
		Optional<Endereco> endecoBancoDeDados = consultarEndecoBancoDeDados(cep);
		
		if(endecoBancoDeDados.isPresent()) {
			return endecoBancoDeDados.get();
			
		}else {
			
			EnderecoDto enderecoWebService = consultarEnderecoWebService(cep);
			
			if(enderecoWebService != null) {
				
			Optional<Cidade> cidade = bucarCidade(enderecoWebService);

			Endereco endereco = new EnderecoBuilder()
												.comCep(enderecoWebService.getCep())
												.comLogradouro(enderecoWebService.getLogradouro())
												.comBairro(enderecoWebService.getBairro())
												.comComplemento(enderecoWebService.getComplemento())
												.comCidade(cidade.orElse(null))
												.construir();
			
			return endereco;
			}
		}
		
		return null;
		
	}

	private Optional<Cidade> bucarCidade(EnderecoDto enderecoWebService) {
		Optional<Cidade> cidade = cidadeRepository.findByNome(enderecoWebService.getLocalidade());
		return cidade;
	}
	
	private Optional<Endereco> consultarEndecoBancoDeDados (String cep) {
	   
	  return assistenteSocialRepository.buscarEnderecoPorCep(cep);
	   
   }
	
	private EnderecoDto consultarEnderecoWebService(String cep) {
		
		EnderecoDto endereco = enderecoClient.buscarNoViaCep(cep);
		
		return endereco;
	}

}
