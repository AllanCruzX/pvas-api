package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.builder.EnderecoBuilder;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.service.CadastroCidadeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeEnderecoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Autowired
	private CadastroCidadeService cidadeService;

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		Set<Endereco> enderecos = assistenteSocial.getEnderecos().stream()
				.map(endereco -> montaEndereco(endereco, assistenteSocial))
				.collect(Collectors.toSet());

		assistenteSocial.setEnderecos(enderecos);

		return tratarProximo(assistenteSocial);
	}

	private Endereco montaEndereco(Endereco endereco, AssistenteSocial assistenteSocial) {

		Endereco enderecoMontado = null;

		if (endereco.getId() == null) {

			enderecoMontado = new EnderecoBuilder()
					.comCep(endereco.getCep())
					.comLogradouro(endereco.getLogradouro())
					.comBairro(endereco.getBairro())
					.comNumero(endereco.getNumero())
					.comComplemento(endereco.getComplemento())
					.comCidade(cidadeService.buscarOuFalhar(endereco.getCidade().getId()))
					.comPessoaFisica(assistenteSocial)
					.definirComoResidencial()
					.definirComoPrincipal(true)
					.construir();

		} else {

			enderecoMontado = new EnderecoBuilder()
					.comId(endereco.getId())
					.comCep(endereco.getCep())
					.comLogradouro(endereco.getLogradouro())
					.comBairro(endereco.getBairro())
					.comNumero(endereco.getNumero())
					.comComplemento(endereco.getComplemento())
					.comCidade(cidadeService.buscarOuFalhar(endereco.getCidade().getId()))
					.comPessoaFisica(assistenteSocial)
					.definirComoResidencial()
					.definirComoPrincipal(true)
					.construir();

		}
		
		logEndereco(enderecoMontado, assistenteSocial);

		return enderecoMontado;

	}
	
	
	private void logEndereco(Endereco endereco, AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.temCodigo()) {
			log.info("Preparando endereco {}, para o assistente social do codigo {}", endereco.getTipoEndereco().getNome() ,assistenteSocial.getCodigo());
		}else{
			log.info("Preparando endereco {}", endereco.getTipoEndereco().getNome() );
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.QUARTO;
	}

}
