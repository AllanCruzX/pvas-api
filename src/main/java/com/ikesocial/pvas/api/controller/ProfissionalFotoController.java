package com.ikesocial.pvas.api.controller;

import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ikesocial.pvas.api.assembler.FotoAssistenteSocialModelAssembler;
import com.ikesocial.pvas.api.model.input.FotoDoProfissionalInput;
import com.ikesocial.pvas.api.model.output.FotoAssistenteSocialModel;
import com.ikesocial.pvas.api.openapi.controller.ProfissionalFotoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.EntidadeNaoEncontradaException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.Pessoa;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.service.CadastroProfissionalService;
import com.ikesocial.pvas.domain.service.CatalogoFotoProfissional;
import com.ikesocial.pvas.domain.service.FotoStorageService;
import com.ikesocial.pvas.domain.service.FotoStorageService.FotoRecuperada;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path ="/profissionais/{codigoDoProfissional}/foto", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProfissionalFotoController implements ProfissionalFotoControllerOpenApi {

	@Autowired
	private CatalogoFotoProfissional catalogoFotoProfissional;

	@Autowired
	private CadastroProfissionalService cadastroProfissionalService;

	@Autowired
	private FotoAssistenteSocialModelAssembler fotoAssistenteSocialModelAssembler;

	@Autowired
	private FotoStorageService fotoStorage;

	@CheckSecurity.Profissionais.PodeEditar
	@PutMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public FotoAssistenteSocialModel atualizarFoto(@PathVariable String codigoDoProfissional,
			@Valid FotoDoProfissionalInput fotoDoProfissionalInput , @RequestPart(required = true) MultipartFile arquivo) throws IOException {
		log.info("C=ProfissionalFotoController,M=atualizarFoto, Upload da foto do profisional de codigo {}", codigoDoProfissional);

		Profissional profissional = cadastroProfissionalService
				.buscarOuFalharLazy(codigoDoProfissional);
		
		FotoPessoa foto = new FotoPessoa();
		foto.setPessoa(new Pessoa());
		foto.setPessoa(profissional);
		foto.setDescricao(fotoDoProfissionalInput.getDescricao());
		foto.setContentType(arquivo.getContentType());
		foto.setTamanho(arquivo.getSize());
		foto.setNomeArquivo(arquivo.getOriginalFilename());

		FotoPessoa fotoSalva = catalogoFotoProfissional.salvar(foto, arquivo.getInputStream());

		return fotoAssistenteSocialModelAssembler.toModel(fotoSalva);

	}

	@CheckSecurity.Profissionais.PodeBuscar
	@GetMapping(produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<?> servirFoto(@PathVariable String codigoDoProfissional,
			@RequestHeader(name = "accept") String acceptHeader)  {
		
		log.info("C=ProfissionalFotoController,M=servirFoto, Dowload da foto do profissional de codigo {}", codigoDoProfissional);
		
		if (acceptHeader.equals(MediaType.APPLICATION_JSON_VALUE)) {
			return recuperarFoto(codigoDoProfissional);
		}
		
		try {
			FotoPessoa fotoAssistenteSocial = catalogoFotoProfissional.buscarOuFalhar(codigoDoProfissional);
			MediaType mediaTypeFoto = MediaType.parseMediaType(fotoAssistenteSocial.getContentType());
			
			List<MediaType> mediaTypesAceitas = MediaType.parseMediaTypes(acceptHeader);
			
			
				verificarCompatibilidadeMediaType(mediaTypeFoto, mediaTypesAceitas);
		
			FotoRecuperada fotoRecuperada = fotoStorage.recuperar(fotoAssistenteSocial.getNomeArquivo());

			if (fotoRecuperada.temUrl()) {
				return ResponseEntity
						.status(HttpStatus.FOUND)
						.header(HttpHeaders.LOCATION, fotoRecuperada.getUrl())
						.build();
			} else {
				return ResponseEntity.ok()
						.contentType(mediaTypeFoto)
						.body(new InputStreamResource(fotoRecuperada.getInputStream()));
			}

		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
		}catch (HttpMediaTypeNotAcceptableException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}
 
	}
	
	
	public ResponseEntity<?> recuperarFoto(@PathVariable String codigoDoProfissional)  {
		
		FotoPessoa fotoAssistenteSocial = catalogoFotoProfissional.buscarOuFalhar(codigoDoProfissional);
		FotoAssistenteSocialModel fotoAssistenteSocialModel = fotoAssistenteSocialModelAssembler.toModel(fotoAssistenteSocial);
		return ResponseEntity.ok(fotoAssistenteSocialModel);
		
	}
	
	@CheckSecurity.Profissionais.PodeExcluir
	@DeleteMapping
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void excluir(@PathVariable String codigoDoProfissional) {
		log.info("C=ProfissionalFotoController,M=excluir, Excluindo foto do profissional de codigo {}", codigoDoProfissional);
		
		catalogoFotoProfissional.excluir(codigoDoProfissional);
	}   

	
	private void verificarCompatibilidadeMediaType(MediaType mediaTypeFoto, List<MediaType> mediaTypesAceitas)
			throws HttpMediaTypeNotAcceptableException {
		
		log.info("C=ProfissionalFotoController,M=verificarCompatibilidadeMediaType, Verificando compatibilidade");


		boolean compativel = mediaTypesAceitas.stream()
				.anyMatch(mediaTypeAceita -> mediaTypeAceita.isCompatibleWith(mediaTypeFoto));

		if (!compativel) {
			throw new HttpMediaTypeNotAcceptableException(mediaTypesAceitas);
		}
	}

}
