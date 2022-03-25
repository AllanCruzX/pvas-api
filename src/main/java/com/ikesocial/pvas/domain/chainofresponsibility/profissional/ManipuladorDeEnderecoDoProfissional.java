package com.ikesocial.pvas.domain.chainofresponsibility.profissional;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.builder.EnderecoBuilder;
import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.service.CadastroCidadeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeEnderecoDoProfissional extends ManipuladorDeProfissionalBase {

	@Autowired
	private CadastroCidadeService cidadeService;

	@Override
	public boolean tratar(Profissional profissional) {

		Set<Endereco> enderecos = profissional.getEnderecos().stream()
				.map(endereco -> montaEndereco(endereco, profissional))
				.collect(Collectors.toSet());

		profissional.setEnderecos(enderecos);

		return tratarProximo(profissional);
	}

	private Endereco montaEndereco(Endereco endereco, Profissional profissional) {
		logEndereco(endereco, profissional);
		
		Endereco enderecoMontado = null;

		if (endereco.getId() == null) {

			enderecoMontado = new EnderecoBuilder()
					.comCep(endereco.getCep())
					.comLogradouro(endereco.getLogradouro())
					.comBairro(endereco.getBairro())
					.comNumero(endereco.getNumero())
					.comComplemento(endereco.getComplemento())
					.comCidade(cidadeService.buscarOuFalhar(endereco.getCidade().getId()))
					.comPessoaFisica(profissional)
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
					.comPessoaFisica(profissional)
					.definirComoResidencial()
					.definirComoPrincipal(true)
					.construir();

		}
		
		logEndereco(enderecoMontado, profissional);

		return enderecoMontado;

	}
	
	private void logEndereco(Endereco endereco, Profissional profissional) {
		
		if(profissional.temCodigo()) {
			log.info("C=ManipuladorDeEnderecoDoProfissional, M=logEndereco, preparando endereco para o profissional do codigo {}", profissional.getCodigo());
		}else{
			log.info("C=ManipuladorDeEnderecoDoProfissional, M=logEndereco, preparando endereco");
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.TERCEIRO;
	}

}
