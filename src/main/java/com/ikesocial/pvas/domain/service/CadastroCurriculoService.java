package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.chainofresponsibility.curriculo.ManipuladorDeCurriculoBase;
import com.ikesocial.pvas.domain.exception.CurriculoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CadastroCurriculoService {

	@Autowired
	private CurriculoRepository curriculoRepository;
	
	@Autowired
	private List<ManipuladorDeCurriculoBase> manipuladores;

	public Curriculo salvar(Curriculo curriculo) {
		logSalvar(curriculo);
		
		curriculoRepository.detach(curriculo);
		
		manipuladores.stream()
			.sorted((a, b) -> a.getPrioridade().compareTo(b.getPrioridade()))
			.forEach(proximo -> proximo.tratar(curriculo));

		return curriculoRepository.save(curriculo);
	}

	public Curriculo buscarOuFalharLazy(Long curriculoId) {

		return curriculoRepository.findById(curriculoId)
				.orElseThrow(() -> new CurriculoNaoEncontradoException(curriculoId));

	}

	public Curriculo buscarOuFalharEager(Long curriculoId) {

		try {
			return curriculoRepository.buscarPorId(curriculoId).get();
		} catch (EmptyResultDataAccessException e) {
			throw new CurriculoNaoEncontradoException(curriculoId);

		}

	}
	
	
	private void logSalvar(Curriculo curriculo) {
		
		if(!curriculo.isNovo()) {
			log.info("C=CadastroCurriculoService, M=logSalvar, salvando o curriculo do codigo {}",curriculo.getId());
		}else{
			log.info("C=CadastroCurriculoService, M=logSalvar, salvando um novo curriculo ");
		}
	}
	

}
