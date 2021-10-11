package com.ikesocial.pvas.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.openapi.controller.EstatisticasControllerOpenApi;
import com.ikesocial.pvas.domain.filter.AssistenteSocialEstatisticaFilter;
import com.ikesocial.pvas.domain.model.dto.AssistenteSocialEstatistica;
import com.ikesocial.pvas.domain.service.AssistenteSocialQueryService;
import com.ikesocial.pvas.domain.service.AssitenteSocialReportService;

@RestController
@RequestMapping(path = "/estatisticas")
public class EstatisticasController implements EstatisticasControllerOpenApi {

	@Autowired
	private AssistenteSocialQueryService assistenteSocialQueryService;
	
	@Autowired
	private AssitenteSocialReportService  assitenteSocialReportService;

	@Override
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public List<AssistenteSocialEstatistica> consultarAssistenteSocialEstatisticas(AssistenteSocialEstatisticaFilter filtro,
			@RequestParam(required = false, defaultValue = "+00:00") String timeOffset) {
		
		return assistenteSocialQueryService.consultarAssistenteSocialEstatisticas(filtro, timeOffset);
	}
	
	@Override
	@GetMapping(produces = MediaType.APPLICATION_PDF_VALUE)
	public ResponseEntity<byte[]> consultarAssistenteSocialEstatisticasPdf(AssistenteSocialEstatisticaFilter filtro,
			@RequestParam(required = false, defaultValue = "+00:00") String timeOffset) {
		
		byte[] bytesPdf = assitenteSocialReportService.emitirAssistenteSocialEstatisticas(filtro, timeOffset);
		
		var headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=assistente-social-estatistica.pdf");
		
		return ResponseEntity.ok()
				.contentType(MediaType.APPLICATION_PDF)
				.headers(headers)
				.body(bytesPdf);
		
	}

}
