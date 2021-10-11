package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.CidadeEmUsoException;
import com.ikesocial.pvas.domain.exception.CidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.repository.CidadeRepository;

@Service
public class CadastroCidadeService {
	
	@Autowired
	private CidadeRepository cidadeRepository;

	@Autowired
	private CadastroEstadoService cadastroEstadoService;

	public Cidade salvar(Cidade cidade) {

		Long estadoId = cidade.getEstado().getId();

		Estado estado = cadastroEstadoService.buscarOuFalhar(estadoId);

		cidade.setEstado(estado);

		return cidadeRepository.save(cidade);
	}

	public void excluir(Long cidadeId) {

		try {
			cidadeRepository.deleteById(cidadeId);

		} catch (EmptyResultDataAccessException e) {
			throw new CidadeNaoEncontradoException(cidadeId);

		} catch (DataIntegrityViolationException e) {
			throw new CidadeEmUsoException(cidadeId);
		}
	}

	public Cidade buscarOuFalhar(Long cidadeId) {

		return cidadeRepository.findById(cidadeId).orElseThrow(() -> new CidadeNaoEncontradoException(cidadeId));

	}
	
	public Cidade buscarOuFalhar(String nome) {

		return cidadeRepository.findByNome(nome).orElseThrow(() -> new CidadeNaoEncontradoException(nome));

	}

}
