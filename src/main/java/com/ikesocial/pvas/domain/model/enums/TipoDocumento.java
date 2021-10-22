package com.ikesocial.pvas.domain.model.enums;

import java.util.EnumSet;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.service.CpfStrategy;
import com.ikesocial.pvas.domain.service.CressStrategy;
import com.ikesocial.pvas.domain.service.DocumentoStrategy;

import lombok.Getter;

@Component
@Getter
public enum TipoDocumento {

	RG {
		@Override
		public DocumentoStrategy obterDocumento() {
			return null;
		}
	},
	CPF {
		@Override
		public DocumentoStrategy obterDocumento() {
		return cpfStrategy;
		}
		
	},
	CNH {
		@Override
		public DocumentoStrategy obterDocumento() {
			return null;
		}
	},	
	CTPS {
		@Override
		public DocumentoStrategy obterDocumento() {
			return null;
		}
	},
	TITULO_ELEITOR {
		@Override
		public DocumentoStrategy obterDocumento() {
			return null;
		}
	},	
	CARTEIRA_PROFISSIONAL {
		@Override
		public DocumentoStrategy obterDocumento() {
			return cressStrategy;
		}
	},
	RESERVISTA {
		@Override
		public DocumentoStrategy obterDocumento() {
			return null;
		}
	};	
	
	private static CpfStrategy cpfStrategy;
	
	private static CressStrategy cressStrategy;
	
	public abstract DocumentoStrategy obterDocumento();
	
	@Component
	public static class ServiceInjector {
		
	    @Autowired
	    private  CpfStrategy cpfStrategy;
	    @Autowired
		private  CressStrategy cressStrategy;

	    @PostConstruct
	    public void postConstruct() {
	        for (TipoDocumento item : EnumSet.allOf(TipoDocumento.class)) {
	            item.setCpfStrategy(cpfStrategy);
	            item.setCressStrategy(cressStrategy);
	        }
	    }
	}
	
	
	private void setCpfStrategy(CpfStrategy cpfStrategy) {
	    TipoDocumento.cpfStrategy = cpfStrategy;
	}

	private void setCressStrategy(CressStrategy cressStrategy) {
	    TipoDocumento.cressStrategy = cressStrategy;
	}
}
