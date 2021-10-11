package com.ikesocial.pvas.domain.model.enums;

import com.ikesocial.pvas.domain.service.CpfStrategy;
import com.ikesocial.pvas.domain.service.CressStrategy;
import com.ikesocial.pvas.domain.service.DocumentoStrategy;

import lombok.Getter;

@Getter
public enum TipoDocumento {

	RG {
		@Override
		public DocumentoStrategy obterDocumento() {
			// TODO Auto-generated method stub
			return null;
		}
	},
	CPF {
		@Override
		public DocumentoStrategy obterDocumento() {
			return new CpfStrategy();
		}
	},
	CNH {
		@Override
		public DocumentoStrategy obterDocumento() {
			// TODO Auto-generated method stub
			return null;
		}
	},	
	CTPS {
		@Override
		public DocumentoStrategy obterDocumento() {
			// TODO Auto-generated method stub
			return null;
		}
	},
	TITULO_ELEITOR {
		@Override
		public DocumentoStrategy obterDocumento() {
			// TODO Auto-generated method stub
			return null;
		}
	},	
	CARTEIRA_PROFISSIONAL {
		@Override
		public DocumentoStrategy obterDocumento() {
			// TODO Auto-generated method stub
			return new CressStrategy();
		}
	},
	RESERVISTA {
		@Override
		public DocumentoStrategy obterDocumento() {
			// TODO Auto-generated method stub
			return null;
		}
	};	
	
	public abstract DocumentoStrategy obterDocumento();
}