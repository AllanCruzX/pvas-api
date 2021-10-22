package com.ikesocial.pvas.domain.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.builder.DocumentoBuilder;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;


@Service
public class CressStrategy implements DocumentoStrategy {
	
	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;
	
	@Autowired
	private CadastroEstadoService estadoService;
	
	@Override
	public Documento definirDocumento(Documento documento , AssistenteSocial assistenteSocial ) {

		validaCressExistente(documento, documento.getEstado().getId() );

		Documento documentoNovo = new DocumentoBuilder()
										.comCodigo(documento.getCodigo())
										.comTipoDocumento(TipoDocumento.CARTEIRA_PROFISSIONAL)
										.comEstado(estadoService.buscarOuFalhar(documento.getEstado().getId()))
										.comPessoaFisica(assistenteSocial)
										.construir();

		return documentoNovo;
	}
	
	private void validaCressExistente(Documento documento, Long estadoId ) {

		Optional<Documento> cressExistente = assistenteSocialRepository.buscarCressRegiao(estadoId, documento.getCodigo());

		if (cressExistente.isPresent() && !cressExistente.get().equals(documento)) {
			throw new NegocioException(String.format("Já existe uma pessoa física cadastrado com o CRESS %s", documento.getCodigo()));
		}

	}

}
