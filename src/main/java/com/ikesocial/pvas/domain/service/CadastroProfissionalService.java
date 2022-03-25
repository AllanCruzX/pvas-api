package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.chainofresponsibility.profissional.ManipuladorDeProfissionalBase;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.exception.ProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CadastroProfissionalService {

	@Autowired
	private ProfissionalRepository profissionalRepository;

	@Autowired
	private List<ManipuladorDeProfissionalBase> manipuladores;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Transactional
	public Profissional salvar(Profissional profissional) {
		logSalvar(profissional);

		profissionalRepository.detach(profissional);

		manipuladores.stream()
						.sorted((a, b) -> a.getPrioridade().compareTo(b.getPrioridade()))
						.forEach(proximo -> proximo.tratar(profissional));
		
	
		return profissionalRepository.save(profissional);

	}

	@Transactional
	public void ativar(String codigo) {
		log.info("C=CadastroProfissionalService, M=ativar, ativando o profissional com o codigo={}", codigo);
		
		Profissional profissional = buscarOuFalharLazy(codigo);
		profissional.ativar();
	}

	@Transactional
	public void inativar(String codigo) {
		log.info("C=CadastroProfissionalService, M=inativar, inativando o profissional com o codigo={}", codigo);
		
		Profissional profissional = buscarOuFalharLazy(codigo);
		profissional.inativar();
	}

	@Transactional
	public void alterarSenha(String codigo, String senhaAtual, String novaSenha) {
		log.info("C=CadastroProfissionalService, M=alterarSenha, codigo do profissional={}", codigo);
		
		Profissional profissional = buscarOuFalharLazy(codigo);

		if (!passwordEncoder.matches(senhaAtual, profissional.getSenha())) {
			throw new NegocioException("Senha atual informada nao coincide com a senha do profissional.");
		}

		profissional.setSenha(passwordEncoder.encode(novaSenha));
	}

	public Profissional buscarOuFalharEager(String codigo) {
		log.info("C=CadastroProfissionalService, M=buscarOuFalharEager, buscando profissional do codigo={}", codigo);

		try {
			return profissionalRepository.buscarPorCodigo(codigo).get();
		} catch (EmptyResultDataAccessException e) {
			throw new ProfissionalNaoEncontradoException(codigo);

		}
	}

	public Profissional buscarOuFalharLazy(String codigo) {
		log.info("C=CadastroProfissionalService, M=buscarOuFalharLazy, buscando profissional do codigo={}", codigo);

		return profissionalRepository.findByCodigo(codigo)
				.orElseThrow(() -> new ProfissionalNaoEncontradoException(codigo));

	}
	
	public boolean existeProfissionalParaOCurriculo(Long curriculoId, String codigoDoProfissioanl) {

		if (!profissionalRepository.existeProfissionalNoBancoParaOCurriculo(curriculoId, codigoDoProfissioanl)) {
			throw new NegocioException("O Profissional ja esta associado a um curriculo");
		} else {
			return true;
		}

	}
	
	private void logSalvar(Profissional profissional) {
		
		if(profissional.temCodigo()) {
			log.info("C=CadastroProfissionalService, M=logSalvar, salvando o profissional do codigo {}",profissional.getCodigo());
		}else{
			log.info("C=CadastroProfissionalService, M=logSalvar, salvando o profissional ");
		}
	}


}