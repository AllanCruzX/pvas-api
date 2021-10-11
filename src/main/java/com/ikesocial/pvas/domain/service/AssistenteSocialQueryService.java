package com.ikesocial.pvas.domain.service;

import java.util.List;

import com.ikesocial.pvas.domain.filter.AssistenteSocialEstatisticaFilter;
import com.ikesocial.pvas.domain.model.dto.AssistenteSocialEstatistica;

public interface AssistenteSocialQueryService {
	
	public List<AssistenteSocialEstatistica> consultarAssistenteSocialEstatisticas(AssistenteSocialEstatisticaFilter filtro, String timeOffset);

}
