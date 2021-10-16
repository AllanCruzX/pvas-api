package com.ikesocial.pvas.api.controller;

import javax.validation.Valid;

import org.modelmapper.MappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.AssistenteSocialModelAssembler;
import com.ikesocial.pvas.api.assembler.AssistenteSocialResumoModelAssembler;
import com.ikesocial.pvas.api.assembler.disassembler.AssistentesSociaisInputDisassembler;
import com.ikesocial.pvas.api.model.input.AssistenteSocialInput;
import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.api.openapi.controller.AssistenteSocialControllerOpenApi;
import com.ikesocial.pvas.domain.exception.CidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.CursoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.EspecialidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.EspecializacaoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.EstadoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.IdiomaNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.filter.AssistenteSocialFilter;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;
import com.ikesocial.pvas.domain.service.CadastroAssistenteSocialService;

@RestController
@RequestMapping(path = "assistentes-sociais", produces = MediaType.APPLICATION_JSON_VALUE)
public class AssistenteSocialController implements AssistenteSocialControllerOpenApi  {

	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;

	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;

	@Autowired
	private AssistenteSocialResumoModelAssembler assistenteSocialResumoModelAssembler;

	@Autowired
	private AssistenteSocialModelAssembler assistenteSocialModelAssembler;

	@Autowired
	private AssistentesSociaisInputDisassembler assistentesSociaisInputDisassembler;
	
	@Autowired
	private PagedResourcesAssembler<AssistenteSocial> pagedResourcesAssembler;

	@GetMapping
	public PagedModel<AssistenteSocialResumoModel> listar(AssistenteSocialFilter assistenteSocialFilter , 
			@RequestParam(required = false) boolean incluirInativos , @PageableDefault(size = 20) Pageable pageable) {
		
		Page<AssistenteSocial> assistentesSociaisPage = null;
		
		if(incluirInativos) {
			assistentesSociaisPage = assistenteSocialRepository.listarComFiltro(assistenteSocialFilter, pageable);
		}else {
			assistentesSociaisPage = assistenteSocialRepository.listarComFiltroAtivos(assistenteSocialFilter, pageable);
		}
		
		PagedModel<AssistenteSocialResumoModel> assistentesSociaisPageModel =  pagedResourcesAssembler
				.toModel(assistentesSociaisPage, assistenteSocialResumoModelAssembler);
		
		//return pagedResourcesAssembler.toModel(assistentesSociaisPage, assistenteSocialResumoModelAssembler);
		
		return assistentesSociaisPageModel;

	}

	@GetMapping("/{codigoAssistenteSocial}")
	public AssistenteSocialModel buscar(@PathVariable String codigoAssistenteSocial) {

		return assistenteSocialModelAssembler.toModel(cadastroAssistenteSocialService.buscarOuFalhar(codigoAssistenteSocial));
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public AssistenteSocialModel adicionar(@RequestBody @Valid AssistenteSocialInput assistenteSocialInput) {

		try {

			AssistenteSocial assistenteSocial = assistentesSociaisInputDisassembler.toDomainObject(assistenteSocialInput);

			assistenteSocial = cadastroAssistenteSocialService.salvar(assistenteSocial);

			return assistenteSocialModelAssembler.toModel(assistenteSocial);

		} catch (CidadeNaoEncontradoException | EstadoNaoEncontradoException | IdiomaNaoEncontradoException
				| EspecializacaoNaoEncontradoException | EspecialidadeNaoEncontradoException
				| CursoNaoEncontradoException | ExperienciaProfissionalNaoEncontradoException  e) {
			throw new NegocioException(e.getMessage(), e);

		} catch (MappingException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}

	}
	
	@PutMapping("/{codigoPessoaFisica}")
	public AssistenteSocialModel atualizar(@PathVariable String codigoPessoaFisica, @RequestBody @Valid AssistenteSocialInput assistenteSocialInput) {
		try {
			
			AssistenteSocial assistenteSocialAtual = cadastroAssistenteSocialService.buscarOuFalhar(codigoPessoaFisica);
			
			assistentesSociaisInputDisassembler.copyToDomainObject(assistenteSocialInput, assistenteSocialAtual);
			
			assistenteSocialAtual = cadastroAssistenteSocialService.salvar(assistenteSocialAtual);
			
			return assistenteSocialModelAssembler.toModel(assistenteSocialAtual);
			
		} catch (CidadeNaoEncontradoException | EstadoNaoEncontradoException | IdiomaNaoEncontradoException
				| EspecializacaoNaoEncontradoException | EspecialidadeNaoEncontradoException
				| CursoNaoEncontradoException | ExperienciaProfissionalNaoEncontradoException  e) {
			throw new NegocioException(e.getMessage(), e);

		} catch (MappingException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}
	}

	@PutMapping("/{codigoAssistenteSocial}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> ativar(@PathVariable  String codigoAssistenteSocial) {
		cadastroAssistenteSocialService.ativar(codigoAssistenteSocial);
		
		return ResponseEntity.noContent().build();
	}

	@DeleteMapping("/{codigoAssistenteSocial}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> inativar(@PathVariable  String codigoAssistenteSocial) {
		cadastroAssistenteSocialService.inativar(codigoAssistenteSocial);
		
		return ResponseEntity.noContent().build();
	}

}
