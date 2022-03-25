package com.ikesocial.pvas.domain.service;

import com.ikesocial.pvas.domain.filter.ProfissionalEstatisticaFilter;

public interface ProfissionalReportService {
	
	byte[] emitirProfissionalEstatisticas(ProfissionalEstatisticaFilter filtro, String timeOffset);

}
