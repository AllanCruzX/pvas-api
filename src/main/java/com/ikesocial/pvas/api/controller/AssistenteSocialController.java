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
import com.ikesocial.pvas.api.assembler.disassembler.AssistentesSociaisAlterarConverter;
import com.ikesocial.pvas.api.assembler.disassembler.AssistentesSociaisInputDisassembler;
import com.ikesocial.pvas.api.model.input.AssistenteSocialAlterarInput;
import com.ikesocial.pvas.api.model.input.AssistenteSocialInput;
import com.ikesocial.pvas.api.model.input.SenhaInput;
import com.ikesocial.pvas.api.model.output.AssistenteSocialModel;
import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.api.openapi.controller.AssistenteSocialControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "assistentes-sociais", produces = MediaType.APPLICATION_JSON_VALUE)
public class AssistenteSocialController implements AssistenteSocialControllerOpenApi {

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

	@CheckSecurity.AssistentesSociais.PodeConsultar
	@GetMapping
	public PagedModel<AssistenteSocialResumoModel> listar(AssistenteSocialFilter assistenteSocialFilter,
			@RequestParam(required = false) boolean incluirInativos, @PageableDefault(size = 20) Pageable pageable) {
		log.info("Consultando assistentes socias com páginas de {} registros...", pageable.getPageSize());

		Page<AssistenteSocial> assistentesSociaisPage = null;

		if (incluirInativos) {
			assistentesSociaisPage = assistenteSocialRepository.listarComFiltro(assistenteSocialFilter, pageable);
		} else {
			assistentesSociaisPage = assistenteSocialRepository.listarComFiltroAtivos(assistenteSocialFilter, pageable);
		}

		PagedModel<AssistenteSocialResumoModel> assistentesSociaisPageModel = pagedResourcesAssembler
				.toModel(assistentesSociaisPage, assistenteSocialResumoModelAssembler);

		return assistentesSociaisPageModel;

	}

	@CheckSecurity.AssistentesSociais.PodeBuscar
	@GetMapping("/{codigoAssistenteSocial}")
	public AssistenteSocialModel buscar(@PathVariable String codigoAssistenteSocial) {

		log.info("Buscando assistente social com o codigo {}", codigoAssistenteSocial);

		return assistenteSocialModelAssembler
				.toModel(cadastroAssistenteSocialService.buscarOuFalhar(codigoAssistenteSocial));
	}

	@CheckSecurity.AssistentesSociais.PodeCadastrar
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public AssistenteSocialModel adicionar(@RequestBody @Valid AssistenteSocialInput assistenteSocialInput) {

		try {

			AssistenteSocial assistenteSocial = assistentesSociaisInputDisassembler
					.toDomainObject(assistenteSocialInput);

			assistenteSocial = cadastroAssistenteSocialService.salvar(assistenteSocial);

			log.info("Cadastro de assistente social com o codigo {}", assistenteSocial.getCodigo());

			return assistenteSocialModelAssembler.toModel(assistenteSocial);

		} catch (CidadeNaoEncontradoException | EstadoNaoEncontradoException | IdiomaNaoEncontradoException
				| EspecializacaoNaoEncontradoException | EspecialidadeNaoEncontradoException
				| CursoNaoEncontradoException | ExperienciaProfissionalNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);

		} catch (MappingException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}

	}

	@CheckSecurity.AssistentesSociais.PodeEditar
	@PutMapping("/{codigoPessoaFisica}")
	public AssistenteSocialModel atualizar(@PathVariable String codigoPessoaFisica,
			@RequestBody @Valid AssistenteSocialAlterarInput assistenteSocialAlterarInput) {
		try {

			AssistenteSocial assistenteSocialRecuperado = cadastroAssistenteSocialService
					.buscarOuFalhar(codigoPessoaFisica);

			AssistenteSocial assistenteSocialAtual = AssistentesSociaisAlterarConverter
					.copyToDomainObject(assistenteSocialAlterarInput, assistenteSocialRecuperado);

			assistenteSocialAtual = cadastroAssistenteSocialService.salvar(assistenteSocialAtual);

			log.info("Atualizando assistente social com o codigo {}", assistenteSocialAtual.getCodigo());

			return assistenteSocialModelAssembler.toModel(assistenteSocialAtual);

		} catch (CidadeNaoEncontradoException | EstadoNaoEncontradoException | IdiomaNaoEncontradoException
				| EspecializacaoNaoEncontradoException | EspecialidadeNaoEncontradoException
				| CursoNaoEncontradoException | ExperienciaProfissionalNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);

		} catch (MappingException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}
	}

	@CheckSecurity.AssistentesSociais.PodeAtivarOuInativar
	@PutMapping("/{codigoAssistenteSocial}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> ativar(@PathVariable String codigoAssistenteSocial) {
		cadastroAssistenteSocialService.ativar(codigoAssistenteSocial);

		log.info("Inativando assistente social com o codigo {}", codigoAssistenteSocial);

		return ResponseEntity.noContent().build();
	}

	@CheckSecurity.AssistentesSociais.PodeAtivarOuInativar
	@DeleteMapping("/{codigoAssistenteSocial}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> inativar(@PathVariable String codigoAssistenteSocial) {
		cadastroAssistenteSocialService.inativar(codigoAssistenteSocial);

		log.info("Ativando assistente social com o codigo {}", codigoAssistenteSocial);

		return ResponseEntity.noContent().build();
	}

	@CheckSecurity.AssistentesSociais.PodeEditar
	@PutMapping("/{codigoAssistenteSocial}/senha")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void alterarSenha(@PathVariable String codigoAssistenteSocial, @RequestBody @Valid SenhaInput senha) {
		log.info("Alterando senha do assistente social com o codigo {}", codigoAssistenteSocial);

		cadastroAssistenteSocialService.alterarSenha(codigoAssistenteSocial, senha.getSenhaAtual(),
				senha.getNovaSenha());
	}

}
