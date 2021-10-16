package com.ikesocial.pvas.domain.service;

import java.util.Optional;

import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.builder.DocumentoBuilder;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;


public class CressStrategy implements DocumentoStrategy {
	
	@Override
	public Documento definirDocumento(Documento documento , CadastroEstadoService estadoService , AssistenteSocialRepository assistenteSocialRepository , AssistenteSocial assistenteSocial ) {

		validaCressExistente(documento, documento.getEstado().getId() , estadoService , assistenteSocialRepository );

		Documento documentoNovo = new DocumentoBuilder()
										.comCodigo(documento.getCodigo())
										.comTipoDocumento(TipoDocumento.CARTEIRA_PROFISSIONAL)
										.comEstado(estadoService.buscarOuFalhar(documento.getEstado().getId()))
										.comPessoaFisica(assistenteSocial)
										.construir();

		return documentoNovo;
	}
	
	private void validaCressExistente(Documento documento, Long estadoId , CadastroEstadoService estadoService , AssistenteSocialRepository assistenteSocialRepository ) {

		Optional<Documento> cressExistente = assistenteSocialRepository.buscarCressRegiao(estadoId, documento.getCodigo());

		if (cressExistente.isPresent() && !cressExistente.get().equals(documento)) {
			throw new NegocioException(String.format("Já existe uma pessoa física cadastrado com o CRESS %s", documento.getCodigo()));
		}

	}

}
