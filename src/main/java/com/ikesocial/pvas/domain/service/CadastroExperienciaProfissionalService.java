package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalEmUsoException;
import com.ikesocial.pvas.domain.exception.ExperienciaProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.repository.ExperienciaProfissionalRepository;

@Service
public class CadastroExperienciaProfissionalService {

	@Autowired
	private ExperienciaProfissionalRepository experienciaProfissionalRepository;
	
	@Autowired
	private CadastroAssistenteSocialService pessoaFisicaService;
	
	
	@Transactional
	public ExperienciaProfissional salvar(ExperienciaProfissional experienciaProfissional) {
		
		experienciaProfissionalRepository.detach(experienciaProfissional);

		preparaExperienciaProfissional(experienciaProfissional);

		return experienciaProfissionalRepository.save(experienciaProfissional);
	}
	
	
	public ExperienciaProfissional buscarOuFalhar(Long experienciaProfissionalId) {

		return experienciaProfissionalRepository.findById(experienciaProfissionalId)
				.orElseThrow(() -> new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId));

	}

	

	private void preparaExperienciaProfissional(ExperienciaProfissional experienciaProfissional) {
		
		validaData(experienciaProfissional);
		
		AssistenteSocial assistenteSocial = pessoaFisicaService.buscarOuFalharAssistenteSocialSemComplementos(experienciaProfissional.getAssistenteSocial().getCodigo());
		
		experienciaProfissional.setAssistenteSocial(assistenteSocial);
	}
	
	@Transactional
	public void excluir(Long experienciaProfissionalId) {

		try {

			experienciaProfissionalRepository.deleteById(experienciaProfissionalId);
			experienciaProfissionalRepository.flush();

		} catch (EmptyResultDataAccessException e) {
			throw new ExperienciaProfissionalNaoEncontradoException(experienciaProfissionalId);

		} catch (DataIntegrityViolationException e) {
			throw new ExperienciaProfissionalEmUsoException(experienciaProfissionalId);
		}

	}
	private void validaData (ExperienciaProfissional experienciaProfissional) {
		
		//TODO : implementar chean of reposability
		
		if(experienciaProfissional.getSemExperiencia()) {
			experienciaProfissional.naoTemExperienciaProfissional();
		}else if(experienciaProfissional.getDataFim().isBefore(experienciaProfissional.getDataInicio()) ) {
			throw new NegocioException("A data fim não pode acontecer antes da data início");
		}
		
	}

}
