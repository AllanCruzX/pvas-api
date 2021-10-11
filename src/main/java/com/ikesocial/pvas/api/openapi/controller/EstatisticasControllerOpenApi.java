package com.ikesocial.pvas.api.openapi.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.domain.filter.AssistenteSocialEstatisticaFilter;
import com.ikesocial.pvas.domain.model.dto.AssistenteSocialEstatistica;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@Api(tags = "Estatísticas")
public interface EstatisticasControllerOpenApi {

	@ApiOperation("Consulta estatísticas")
	List<AssistenteSocialEstatistica> consultarAssistenteSocialEstatisticas(AssistenteSocialEstatisticaFilter filtro,
			  @ApiParam(value = "Deslocamento de horário a ser considerado na consulta em relação ao UTC",
              defaultValue = "+00:00")String timeOffset);

	ResponseEntity<byte[]> consultarAssistenteSocialEstatisticasPdf(AssistenteSocialEstatisticaFilter filtro,
			String timeOffset);

}