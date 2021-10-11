package com.ikesocial.pvas.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ikesocial.pvas.domain.exception.EstadoNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.repository.EstadoRepository;

@Service
public class CadastroEstadoService {
	
	@Autowired
	private EstadoRepository estadoRepository;

	public Estado salvar(Estado estado) {

		return estadoRepository.save(estado);
	}

	public Estado buscarOuFalhar(Long estadoId) {
		return estadoRepository.findById(estadoId).orElseThrow(
				() -> new EstadoNaoEncontradoException(estadoId));
	}

}
