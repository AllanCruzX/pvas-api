package com.ikesocial.pvas.domain.builder;

import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;

public class DocumentoBuilder {
	
	private Documento documento;
	
	public DocumentoBuilder() {
		this.documento = new Documento();
	}
	
	public DocumentoBuilder comId(Long id) {
		documento.setId(id);
		return this;
	}
	
	public DocumentoBuilder comCodigo(String codigo) {
		documento.setCodigo(codigo);
		return this;
	}
	
	public DocumentoBuilder comTipoDocumento(TipoDocumento tipoDocumento) {
		documento.setTipoDocumento(tipoDocumento);
		return this;
	}
	
	public DocumentoBuilder comPessoaFisica(AssistenteSocial assistenteSocial) {
		documento.setPessoa(new AssistenteSocial());
		documento.setPessoa(assistenteSocial);
		return this;
	}
	
	public DocumentoBuilder comEstado(Estado estado) {
		documento.setEstado(new Estado());
		documento.setEstado(estado);
		return this;
	}
	
	public Documento construir() {
		return this.documento;
	}

}
