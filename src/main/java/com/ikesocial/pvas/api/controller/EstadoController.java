package com.ikesocial.pvas.api.controller;

import java.time.OffsetDateTime;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.CacheControl;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.filter.ShallowEtagHeaderFilter;

import com.ikesocial.pvas.api.assembler.EstadoModelAssembler;
import com.ikesocial.pvas.api.model.output.EstadoModel;
import com.ikesocial.pvas.api.openapi.controller.EstadoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.repository.EstadoRepository;
import com.ikesocial.pvas.domain.service.CadastroEstadoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "estados", produces = MediaType.APPLICATION_JSON_VALUE)
public class EstadoController implements EstadoControllerOpenApi {
	private static final String VALOR_INICIAL = "0";

	@Autowired
	private EstadoRepository estadoRepository;

	@Autowired
	private CadastroEstadoService cadastroEstadoService;

	@Autowired
	private EstadoModelAssembler estadoModelAssembler;

	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping
	public ResponseEntity<CollectionModel<EstadoModel>> listar(ServletWebRequest request) {
		log.info("Consultando estados ");
		ShallowEtagHeaderFilter.disableContentCaching(request.getRequest());

		String eTag = VALOR_INICIAL;

		OffsetDateTime dataUltimaAtualizacao = estadoRepository.getDataUltimaAtualizacao();

		if (dataUltimaAtualizacao != null) {
			eTag = String.valueOf(dataUltimaAtualizacao.toEpochSecond());
		}

		if (request.checkNotModified(eTag)) {
			return null;
		}

		CollectionModel<EstadoModel> estdosModel = estadoModelAssembler.toCollectionModel(estadoRepository.findAll());

		return ResponseEntity.ok()
				.cacheControl(CacheControl
								.maxAge(10, TimeUnit.SECONDS)
								.cachePublic())
				.eTag(eTag)
				.body(estdosModel);
	}

	@CheckSecurity.AssistentesSociais.EstaAutorizado
	@GetMapping("/{estadoId}")
	public EstadoModel buscar(@PathVariable Long estadoId) {

		return estadoModelAssembler.toModel(cadastroEstadoService.buscarOuFalhar(estadoId));
	}

}
