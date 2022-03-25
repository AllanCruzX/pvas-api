package com.ikesocial.pvas.domain.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.builder.DocumentoBuilder;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;

@Service
public class CpfStrategy implements DocumentoStrategy {

	@Autowired
	private ProfissionalRepository profissionalRepository;

	@Override
	public Documento definirDocumento(Documento documento, Profissional profissional) {

		validaCpfExistente(documento, profissionalRepository);

		Documento documentoNovo = null;

		if (documento.getId() == null) {

			documentoNovo = new DocumentoBuilder()
					.comCodigo(documento.getCodigo())
					.comTipoDocumento(TipoDocumento.CPF)
					.comPessoaFisica(profissional)
					.construir();

		} else {

			documentoNovo = new DocumentoBuilder()
					.comId(documento.getId())
					.comCodigo(documento.getCodigo())
					.comTipoDocumento(TipoDocumento.CPF)
					.comPessoaFisica(profissional)
					.construir();

		}

		return documentoNovo;
	}

	private void validaCpfExistente(Documento documento, ProfissionalRepository profissionalRepository) {

		Optional<Documento> cpfExistente = profissionalRepository.buscarCPF(documento.getCodigo());

		if (cpfExistente.isPresent() && !cpfExistente.get().equals(documento)) {
			throw new NegocioException(
					String.format("Já existe um profissional cadastrado com o CPF %s", documento.getCodigo()));
		}

	}

}
