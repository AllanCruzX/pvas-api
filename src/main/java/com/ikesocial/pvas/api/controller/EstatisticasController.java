package com.ikesocial.pvas.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.ProfissionalEstatisticaModelAssembler;
import com.ikesocial.pvas.api.model.output.ProfissionalEstatisticaModel;
import com.ikesocial.pvas.api.openapi.controller.EstatisticasControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.dto.ProfissionalEstatistica;
import com.ikesocial.pvas.domain.filter.ProfissionalEstatisticaFilter;
import com.ikesocial.pvas.domain.service.ProfissionalQueryService;
import com.ikesocial.pvas.domain.service.ProfissionalReportService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/estatisticas")
public class EstatisticasController implements EstatisticasControllerOpenApi {

	@Autowired
	private ProfissionalQueryService profissionalQueryService;
	
	@Autowired
	private ProfissionalReportService  profissionalReportService;
	
	@Autowired
	private ProfissionalEstatisticaModelAssembler profissionalEstatisticaModelAssembler;
	

	@CheckSecurity.Relatorios.PodeConsultar
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public CollectionModel<ProfissionalEstatisticaModel> consultarProfissionalEstatisticas(ProfissionalEstatisticaFilter filtro,
			@RequestParam(required = false, defaultValue = "+00:00") String timeOffset) {
		log.info("C=EstatisticasController, M=consultarProfissionalEstatisticas, consultado estatistica ...");
		
		List<ProfissionalEstatistica> lista = profissionalQueryService.consultarProfissionalEstatisticas(filtro, timeOffset);
		
		
		return profissionalEstatisticaModelAssembler.toCollectionModel(lista);
	}
	
	@CheckSecurity.Relatorios.PodeConsultar
	@GetMapping(produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<byte[]> consultarProfissionalEstatisticasPdf(ProfissionalEstatisticaFilter filtro,
			@RequestParam(required = false, defaultValue = "+00:00") String timeOffset) {
		log.info("C=EstatisticasController, M=consultarProfissionalEstatisticasPdf, consultado estatistica ...");

		
		byte[] bytesPdf = profissionalReportService.emitirProfissionalEstatisticas(filtro, timeOffset);
		
		var headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=assistente-social-estatistica.pdf");
		
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_PDF)
				.headers(headers)
				.body(bytesPdf);
		
	}

}
