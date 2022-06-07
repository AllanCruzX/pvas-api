package com.ikesocial.pvas.domain.chainofresponsibility.profissional;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.chainofresponsibility.PrioridadeConstants;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.service.DocumentoStrategy;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeDocumentoDoProfissional extends ManipuladorDeProfissionalBase {

	@Override
	public boolean tratar(Profissional profissional) {

		Set<Documento> documentos = profissional.getDocumentos().stream()
								.map(documento -> montaDocumento(documento, profissional))
								.collect(Collectors.toSet());

		profissional.setDocumentos(documentos);

		return tratarProximo(profissional);
	}

	protected Documento montaDocumento(Documento documento, Profissional profissional) {
		
		logDocumento(documento, profissional);

		TipoDocumento tipo = documento.getTipoDocumento();

		DocumentoStrategy documentoMontado = tipo.obterDocumento();

		documento = documentoMontado.definirDocumento(documento, profissional);

		return documento;
	}
	
	
	private void logDocumento(Documento documento, Profissional profissional) {
		
		if(profissional.temCodigo()) {
			log.info("C=ManipuladorDeDocumentoDoProfissional, M=logDocumento, preparando documento {}, para o profissional do codigo {}", documento.getTipoDocumento().name() ,profissional.getCodigo());
		}else{
			log.info("C=ManipuladorDeDocumentoDoProfissional, M=logDocumento, preparando documento {}", documento.getTipoDocumento().name());
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SEGUNDO;
	}

}
