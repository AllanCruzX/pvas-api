package com.ikesocial.pvas.api.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.ikesocial.pvas.api.model.output.ProfissionalEstatisticaModel;
import com.ikesocial.pvas.domain.filter.ProfissionalEstatisticaFilter;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@Api(tags = "Estatísticas")
public interface EstatisticasControllerOpenApi {

	@ApiOperation(value ="Estatísticas")
	CollectionModel<ProfissionalEstatisticaModel>  consultarProfissionalEstatisticas(ProfissionalEstatisticaFilter filtro,
			  @ApiParam(value = "Deslocamento de horário a ser considerado na consulta em relação ao UTC",
              defaultValue = "+00:00")String timeOffset);

	ResponseEntity<byte[]> consultarProfissionalEstatisticasPdf(ProfissionalEstatisticaFilter filtro,
			String timeOffset);

}