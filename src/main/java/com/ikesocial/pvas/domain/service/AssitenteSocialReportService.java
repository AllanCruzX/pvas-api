package com.ikesocial.pvas.domain.service;

import com.ikesocial.pvas.domain.filter.AssistenteSocialEstatisticaFilter;

public interface AssitenteSocialReportService {
	
	byte[] emitirAssistenteSocialEstatisticas(AssistenteSocialEstatisticaFilter filtro, String timeOffset);

}
