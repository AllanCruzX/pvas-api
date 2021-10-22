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
public class CpfStrategy implements DocumentoStrategy {
	
	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;

	@Override
	public Documento definirDocumento(Documento documento, AssistenteSocial assistenteSocial) {

		validaCpfExistente(documento, assistenteSocialRepository);
		
		Documento documentoNovo = new DocumentoBuilder()
											.comCodigo(documento.getCodigo())
											.comTipoDocumento(TipoDocumento.CPF)
											.comPessoaFisica(assistenteSocial)
											.construir();


		return documentoNovo;
	}

	
	private void validaCpfExistente(Documento documento, AssistenteSocialRepository assistenteSocialRepository) {

		Optional<Documento> cpfExistente = assistenteSocialRepository.buscarCPF(documento.getCodigo());

		if (cpfExistente.isPresent() && !cpfExistente.get().equals(documento)) {
			throw new NegocioException(String.format("Já existe uma pessoa física cadastrado com o CPF %s", documento.getCodigo()));
		}

	}

}
