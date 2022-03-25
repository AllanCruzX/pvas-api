package com.ikesocial.pvas.domain.service;

import java.util.List;

import com.ikesocial.pvas.domain.dto.ProfissionalEstatistica;
import com.ikesocial.pvas.domain.filter.ProfissionalEstatisticaFilter;

public interface ProfissionalQueryService {
	
	public List<ProfissionalEstatistica> consultarProfissionalEstatisticas(ProfissionalEstatisticaFilter filtro, String timeOffset);

}
