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
import com.ikesocial.pvas.api.model.input.FotoAssistenteSocialInput;
import com.ikesocial.pvas.api.model.output.FotoAssistenteSocialModel;
import com.ikesocial.pvas.api.openapi.controller.AssistenteSocialFotoControllerOpenApi;
import com.ikesocial.pvas.domain.exception.EntidadeNaoEncontradaException;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.service.CadastroAssistenteSocialService;
import com.ikesocial.pvas.domain.service.CatalogoFotoAssistenteSocial;
import com.ikesocial.pvas.domain.service.FotoStorageService;
import com.ikesocial.pvas.domain.service.FotoStorageService.FotoRecuperada;

@RestController
@RequestMapping(path ="/assistentes-sociais/{codigoAssistenteSocial}/foto", produces = MediaType.APPLICATION_JSON_VALUE)
public class AssistenteSocialFotoController implements AssistenteSocialFotoControllerOpenApi {

	@Autowired
	private CatalogoFotoAssistenteSocial catalogoFotoAssistenteSocial;

	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;

	@Autowired
	private FotoAssistenteSocialModelAssembler fotoAssistenteSocialModelAssembler;

	@Autowired
	private FotoStorageService fotoStorage;

	@PutMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public FotoAssistenteSocialModel atualizarFoto(@PathVariable String codigoAssistenteSocial,
			@Valid FotoAssistenteSocialInput fotoAssistenteSocialInput , @RequestPart(required = true) MultipartFile arquivo) throws IOException {

		PessoaFisica assistenteSocial = cadastroAssistenteSocialService
				.buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		FotoPessoa foto = new FotoPessoa();
		foto.setPessoa(assistenteSocial);
		foto.setDescricao(fotoAssistenteSocialInput.getDescricao());
		foto.setContentType(arquivo.getContentType());
		foto.setTamanho(arquivo.getSize());
		foto.setNomeArquivo(arquivo.getOriginalFilename());

		FotoPessoa fotoSalva = catalogoFotoAssistenteSocial.salvar(foto, arquivo.getInputStream());

		return fotoAssistenteSocialModelAssembler.toModel(fotoSalva);

	}

	@GetMapping(produces = {MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE, MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<?> servirFoto(@PathVariable String codigoAssistenteSocial,
			@RequestHeader(name = "accept") String acceptHeader) throws HttpMediaTypeNotAcceptableException {
		
		
		if (acceptHeader.equals(MediaType.APPLICATION_JSON_VALUE)) {
			return recuperarFoto(codigoAssistenteSocial);
		}
		
		try {
			FotoPessoa fotoAssistenteSocial = catalogoFotoAssistenteSocial.buscarOuFalhar(codigoAssistenteSocial);
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
		}
	}
	
	
	public ResponseEntity<?> recuperarFoto(@PathVariable String codigoAssistenteSocial)  {
		
		FotoPessoa fotoAssistenteSocial = catalogoFotoAssistenteSocial.buscarOuFalhar(codigoAssistenteSocial);
		FotoAssistenteSocialModel fotoAssistenteSocialModel = fotoAssistenteSocialModelAssembler.toModel(fotoAssistenteSocial);
		return ResponseEntity.ok(fotoAssistenteSocialModel);
		
	}
	
	@DeleteMapping
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void excluir(@PathVariable String codigoAssistenteSocial) {
		catalogoFotoAssistenteSocial.excluir(codigoAssistenteSocial);
	}   

	private void verificarCompatibilidadeMediaType(MediaType mediaTypeFoto, List<MediaType> mediaTypesAceitas)
			throws HttpMediaTypeNotAcceptableException {

		boolean compativel = mediaTypesAceitas.stream()
				.anyMatch(mediaTypeAceita -> mediaTypeAceita.isCompatibleWith(mediaTypeFoto));

		if (!compativel) {
			throw new HttpMediaTypeNotAcceptableException(mediaTypesAceitas);
		}
	}

}
