package com.ikesocial.pvas.api.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.assembler.CurriculoModelAssembler;
import com.ikesocial.pvas.api.assembler.disassembler.CurriculoAlterarConverter;
import com.ikesocial.pvas.api.assembler.disassembler.CurriculoInputDisassembler;
import com.ikesocial.pvas.api.model.input.CurriculoAlterarInput;
import com.ikesocial.pvas.api.model.input.CurriculoInput;
import com.ikesocial.pvas.api.model.output.CurriculoModel;
import com.ikesocial.pvas.api.openapi.controller.CurriculoControllerOpenApi;
import com.ikesocial.pvas.core.security.CheckSecurity;
import com.ikesocial.pvas.domain.exception.CursoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.EspecialidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.EspecializacaoNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.IdiomaNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.exception.ProfissaoNaoEncontradaException;
import com.ikesocial.pvas.domain.exception.ProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.service.CadastroCurriculoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(path = "/curriculos", produces = MediaType.APPLICATION_JSON_VALUE)
public class CurriculoController implements CurriculoControllerOpenApi {

	@Autowired
	private CadastroCurriculoService cadastroCurriculoService;

	@Autowired
	private CurriculoModelAssembler curriculoModelAssembler;

	@Autowired
	private CurriculoInputDisassembler curriculoInputDisassembler;

	@CheckSecurity.Profissionais.PodeBuscar
	@GetMapping("/{curriculoId}")
	public CurriculoModel buscar(@PathVariable Long curriculoId) {
		log.info("C=CurriculoController, M=buscar, Buscando Curriculo com o id {}", curriculoId);

		return curriculoModelAssembler.toModel(cadastroCurriculoService.buscarOuFalharEager(curriculoId));
	}

	@CheckSecurity.Profissionais.EstaAutorizado
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public CurriculoModel adicionar(@RequestBody @Valid CurriculoInput curriculoInput) {
		log.info("C=CurriculoController, M=adicionar, Cadsatrando um novo curriculo");

		try {

			Curriculo curriculo = curriculoInputDisassembler.toDomainObject(curriculoInput);

			curriculo = cadastroCurriculoService.salvar(curriculo);

			return curriculoModelAssembler.toModel(curriculo);

		} catch (ProfissionalNaoEncontradoException | IdiomaNaoEncontradoException
				| EspecializacaoNaoEncontradoException | EspecialidadeNaoEncontradoException
				| CursoNaoEncontradoException | ExperienciaProfissionalNaoEncontradoException
				| ProfissaoNaoEncontradaException e) {
			throw new NegocioException(e.getMessage(), e);
		}

	}

	@CheckSecurity.Profissionais.PodeEditar
	@PutMapping("/{curriculoId}")
	public CurriculoModel atualizar(@PathVariable Long curriculoId, @RequestBody @Valid CurriculoAlterarInput curriculoAlterarInput) {
		log.info("C=CurriculoController, M=atualizar, Atualizando curriculo com o id {}", curriculoId);
		try {
			
			Curriculo curriculoAtual  = cadastroCurriculoService.buscarOuFalharEager(curriculoId);
			
			curriculoAtual = CurriculoAlterarConverter.copyToDomainObject(curriculoAlterarInput, curriculoAtual);
			
			curriculoAtual = cadastroCurriculoService.salvar(curriculoAtual);
			
			return curriculoModelAssembler.toModel(curriculoAtual);
			
		} catch (ProfissionalNaoEncontradoException | IdiomaNaoEncontradoException
				| EspecializacaoNaoEncontradoException | EspecialidadeNaoEncontradoException
				| CursoNaoEncontradoException | ExperienciaProfissionalNaoEncontradoException
				| ProfissaoNaoEncontradaException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}

}
