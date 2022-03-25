package com.ikesocial.pvas.domain.filter;

import java.time.OffsetDateTime;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProfissionalEstatisticaFilter {
	
	private Long estadoId;
	
	private Long ativo; 
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private OffsetDateTime dataCadastro;
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private OffsetDateTime dataIntivacao;

}
