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

import com.ikesocial.pvas.api.assembler.ProfissionalModelAssembler;
import com.ikesocial.pvas.api.assembler.ProfissionalResumoModelAssembler;
import com.ikesocial.pvas.api.assembler.disassembler.ProfissionaisInputDisassembler;
import com.ikesocial.pvas.api.assembler.disassembler.ProfissionalAlterarConverter;
import com.ikesocial.pvas.api.model.input.ProfissionalAlterarInput;
import com.ikesocial.pvas.api.model.input.ProfissionalInput;
import com.ikesocial.pvas.api.model.input.SenhaInput;
import com.ikesocial.pvas.api.model.output.ProfissionalModel;
import com.ikesocial.pvas.api.model.output.ProfissionalResumoModel;
import com.ikesocial.pvas.api.openapi.controller.ProfissionalControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.CidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.EstadoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.filter.ProfissionalFilter;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;
import com.ikesocial.pvas.domain.service.CadastroProfissionalService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "profissionais", produces = MediaType.APPLICATION_JSON_VALUE)
public class ProfissionalController implements ProfissionalControllerOpenApi {

	@Autowired
	private CadastroProfissionalService cadastroProfissionalService;

	@Autowired
	private ProfissionalRepository profissionalRepository;

	@Autowired
	private ProfissionalResumoModelAssembler profissionalResumoModelAssembler;

	@Autowired
	private ProfissionalModelAssembler profissionalModelAssembler;

	@Autowired
	private ProfissionaisInputDisassembler profissionaisInputDisassembler;

	@Autowired
	private PagedResourcesAssembler<Profissional> pagedResourcesAssembler;

	@CheckSecurity.Profissionais.PodeConsultar
	@GetMapping
	public PagedModel<ProfissionalResumoModel> listar(ProfissionalFilter profissionalFilter,
			@RequestParam(required = false) boolean incluirInativos, @PageableDefault(size = 20) Pageable pageable) {
		log.info("C=ProfissionalController,M=listar, Consultando profissionais com páginas de {} registros...",
				pageable.getPageSize());

		Page<Profissional> profissionaisPage = null;

		if (incluirInativos) {
			profissionaisPage = profissionalRepository.listarComFiltro(profissionalFilter, pageable);
		} else {
			profissionaisPage = profissionalRepository.listarComFiltroAtivos(profissionalFilter, pageable);
		}

		PagedModel<ProfissionalResumoModel> profissionaisPageModel = pagedResourcesAssembler.toModel(profissionaisPage,
				profissionalResumoModelAssembler);

		return profissionaisPageModel;

	}

	@CheckSecurity.Profissionais.PodeBuscar
	@GetMapping("/{codigoDoProfissional}")
	public ProfissionalModel buscar(@PathVariable String codigoDoProfissional) {
		log.info("C=ProfissionalController, M=listar, Buscando profissional com o codigoProfissional {}",
				codigoDoProfissional);

		return profissionalModelAssembler
				.toModel(cadastroProfissionalService.buscarOuFalharEager(codigoDoProfissional));
	}

	@CheckSecurity.Profissionais.PodeCadastrar
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public ProfissionalModel adicionar(@RequestBody @Valid ProfissionalInput profissionalInput) {
		log.info("C=ProfissionalController, M=adicionar, Cadsatrando um novo profissional");

		try {

			Profissional profissional = profissionaisInputDisassembler.toDomainObject(profissionalInput);

			profissional = cadastroProfissionalService.salvar(profissional);

			return profissionalModelAssembler.toModel(profissional);

		} catch (CidadeNaoEncontradoException | EstadoNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);

		} catch (MappingException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}

	}

	@CheckSecurity.Profissionais.PodeEditar
	@PutMapping("/{codigoDoProfissional}")
	public ProfissionalModel atualizar(@PathVariable String codigoDoProfissional,
			@RequestBody @Valid ProfissionalAlterarInput profissionalAlterarInput) {
		log.info("C=ProfissionalController, M=atualizar, Atualizando o profissional com o codigoProfissional {}",
				codigoDoProfissional);

		try {

			Profissional profissionalRecuperado = cadastroProfissionalService.buscarOuFalharEager(codigoDoProfissional);

			profissionalRecuperado = ProfissionalAlterarConverter.copyToDomainObject(profissionalAlterarInput,
					profissionalRecuperado);

			return profissionalModelAssembler.toModel(cadastroProfissionalService.salvar(profissionalRecuperado));

		} catch (CidadeNaoEncontradoException | EstadoNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);

		} catch (MappingException e) {
			throw new NegocioException(e.getCause().getMessage(), e);
		}
	}

	@CheckSecurity.Profissionais.PodeAtivarOuInativar
	@PutMapping("/{codigoDoProfissional}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> ativar(@PathVariable String codigoDoProfissional) {
		log.info("C=ProfissionalController, M=ativar, Ativando assistente social com o codigoProfissional {}",
				codigoDoProfissional);

		cadastroProfissionalService.ativar(codigoDoProfissional);

		return ResponseEntity.noContent().build();
	}

	@CheckSecurity.Profissionais.PodeAtivarOuInativar
	@DeleteMapping("/{codigoDoProfissional}/ativo")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> inativar(@PathVariable String codigoDoProfissional) {
		log.info("C=ProfissionalController, M=inativar, Inativando assistente social com o codigoProfissional {}",
				codigoDoProfissional);

		cadastroProfissionalService.inativar(codigoDoProfissional);

		return ResponseEntity.noContent().build();
	}

	@CheckSecurity.Profissionais.PodeEditar
	@PutMapping("/{codigoDoProfissional}/senha")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void alterarSenha(@PathVariable String codigoDoProfissional, @RequestBody @Valid SenhaInput senha) {
		log.info(
				"C=ProfissionalController, M=alterarSenha, Alterando senha do assistente social com o codigoProfissional {}",
				codigoDoProfissional);

		cadastroProfissionalService.alterarSenha(codigoDoProfissional, senha.getSenhaAtual(), senha.getNovaSenha());
	}

}
