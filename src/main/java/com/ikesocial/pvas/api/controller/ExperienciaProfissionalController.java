package com.ikesocial.pvas.api.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.ikesocial.pvas.api.ResourceUriHelper;
import com.ikesocial.pvas.api.assembler.ExperienciaProfissionalModelAssembler;
import com.ikesocial.pvas.api.assembler.disassembler.ExperienciaProfissionalInputDisassembler;
import com.ikesocial.pvas.api.model.input.ExperienciaProfissionalInput;
import com.ikesocial.pvas.api.model.output.ExperienciaProfissionalModel;
import com.ikesocial.pvas.api.openapi.controller.ExperienciaProfissionalControllerOpenApi;
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.repository.ExperienciaProfissionalRepository;
import com.ikesocial.pvas.domain.service.CadastroAssistenteSocialService;
import com.ikesocial.pvas.domain.service.CadastroExperienciaProfissionalService;

@RestController
@RequestMapping(path = "/experiencias-proficionais", produces = MediaType.APPLICATION_JSON_VALUE)
public class ExperienciaProfissionalController implements ExperienciaProfissionalControllerOpenApi {

	@Autowired
	private ExperienciaProfissionalRepository experienciaProfissionalRepository;

	@Autowired
	private CadastroExperienciaProfissionalService cadastroExperienciaProfissionalService;

	@Autowired
	private ExperienciaProfissionalModelAssembler experienciaProfissionalModelAssembler;

	@Autowired
	private ExperienciaProfissionalInputDisassembler experienciaProfissionalInputDisassembler;

	@Autowired
	private CadastroAssistenteSocialService cadastroAssistenteSocialService;

	@Override
	@GetMapping("/{experienciaProfissionalId}")
	public ExperienciaProfissionalModel buscar(@PathVariable Long experienciaProfissionalId) {
		return experienciaProfissionalModelAssembler
				.toModel(cadastroExperienciaProfissionalService.buscarOuFalhar(experienciaProfissionalId));
	}

	@Override
	@GetMapping("/assitente-social/{codigoAssistenteSocial}")
	public CollectionModel<ExperienciaProfissionalModel> buscarExperienciaProfissionalsDaAssistenteSocial(
			@PathVariable String codigoAssistenteSocial) {

		try {
			cadastroAssistenteSocialService.buscarOuFalhar(codigoAssistenteSocial);
			
			List<ExperienciaProfissional> experienciasProfissionais = experienciaProfissionalRepository.lirtarExperienciaProfissionalDaAssistenteSocial(codigoAssistenteSocial);

			CollectionModel<ExperienciaProfissionalModel> experienciasProfissionaisModel = experienciaProfissionalModelAssembler.toCollectionModel(experienciasProfissionais);

			return experienciasProfissionaisModel;
		} catch (AssistenteSocialNaoEncontradoException e) {

			throw new NegocioException(e.getMessage(), e);
		}
	}

	@Override
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public ExperienciaProfissionalModel adicionar(
			@RequestBody @Valid ExperienciaProfissionalInput experienciaProfissionalInput) {

		try {

			ExperienciaProfissional experienciaProfissional = experienciaProfissionalInputDisassembler
					.toDomainObject(experienciaProfissionalInput);
			experienciaProfissional = cadastroExperienciaProfissionalService.salvar(experienciaProfissional);

			ExperienciaProfissionalModel experienciaProfissionalModel = experienciaProfissionalModelAssembler
					.toModel(experienciaProfissional);

			ResourceUriHelper.addUriInResponseHeader(experienciaProfissionalModel.getId());

			return experienciaProfissionalModel;
		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}

	}

	@Override
	@PutMapping("/{experienciaProfissionalId}")
	public ExperienciaProfissionalModel atualizar(@PathVariable Long experienciaProfissionalId,
			@RequestBody @Valid ExperienciaProfissionalInput experienciaProfissionalInput) {
		try {

			ExperienciaProfissional experienciaProfissionalAtual = cadastroExperienciaProfissionalService
					.buscarOuFalhar(experienciaProfissionalId);

			experienciaProfissionalInputDisassembler.copyToDomainObject(experienciaProfissionalInput,
					experienciaProfissionalAtual);

			experienciaProfissionalAtual = cadastroExperienciaProfissionalService.salvar(experienciaProfissionalAtual);
			return experienciaProfissionalModelAssembler.toModel(experienciaProfissionalAtual);

		} catch (AssistenteSocialNaoEncontradoException e) {
			throw new NegocioException(e.getMessage(), e);
		}
	}

	@Override
	@DeleteMapping("/{experienciaProfissionalId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long experienciaProfissionalId) {
		cadastroExperienciaProfissionalService.excluir(experienciaProfissionalId);
	}

}
