package com.ikesocial.pvas.domain.chainofresponsibility;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.service.DocumentoStrategy;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class ManipuladorDeDocumentoAssistenteSocial extends ManipuladorDeAssitenteSocialBase {

	@Override
	public boolean tratar(AssistenteSocial assistenteSocial) {

		Set<Documento> documentos = assistenteSocial.getDocumentos().stream()
								.map(documento -> montaDocumento(documento, assistenteSocial))
								.collect(Collectors.toSet());

		assistenteSocial.setDocumentos(documentos);

		return tratarProximo(assistenteSocial);
	}

	private Documento montaDocumento(Documento documento, AssistenteSocial assistenteSocial) {
		
		logDocumento(documento, assistenteSocial);

		TipoDocumento tipo = documento.getTipoDocumento();

		DocumentoStrategy documentoMontado = tipo.obterDocumento();

		documento = documentoMontado.definirDocumento(documento, assistenteSocial);

		return documento;
	}
	
	
	private void logDocumento(Documento documento, AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.temCodigo()) {
			log.info("Preparando documento {}, para o assistente social do codigo {}", documento.getTipoDocumento().name() ,assistenteSocial.getCodigo());
		}else{
			log.info("Preparando documento {}", documento.getTipoDocumento().name());
		}
	}

	@Override
	public Integer getPrioridade() {
		return PrioridadeConstants.SEGUNDO;
	}

}
