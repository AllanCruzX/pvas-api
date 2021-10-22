package com.ikesocial.pvas.domain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.chainofresponsibility.ManipuladorDeAssitenteSocialBase;
import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;

@Service
public class CadastroAssistenteSocialService {

	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;

	@Autowired
	 private List <ManipuladorDeAssitenteSocialBase> manipuladores;

	@Transactional
	public AssistenteSocial salvar(AssistenteSocial assistenteSocial) {
		
		assistenteSocialRepository.detach(assistenteSocial);
		
		manipuladores.stream()
				.sorted((a, b) -> a.getPrioridade().compareTo(b.getPrioridade()))
		 		.forEach(proximo -> proximo.tratar(assistenteSocial));
		
		return assistenteSocialRepository.save(assistenteSocial);

	}
	
	@Transactional
	public void ativar(String codigoAssistenteSocial) {
		AssistenteSocial pessoaFisicaAtual = buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		pessoaFisicaAtual.ativar();
	}
	
	@Transactional
	public void inativar(String codigoAssistenteSocial) {
		AssistenteSocial assistenteSocial = buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		assistenteSocial.inativar();
	}
	
	@Transactional
	public void alterarSenha(String codigoAssistenteSocial, String senhaAtual, String novaSenha) {
		AssistenteSocial assistenteSocial = buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		if (assistenteSocial.senhaNaoCoincideCom(senhaAtual)) {
			throw new NegocioException("Senha atual informada não coincide com a senha do usuário.");
		}
		
		assistenteSocial.setSenha(novaSenha);
	}

	public AssistenteSocial buscarOuFalhar(String codigo) {
		
		try {
			return assistenteSocialRepository.buscarPorCodigo(codigo).get();
		} catch (EmptyResultDataAccessException e) {
			 throw new AssistenteSocialNaoEncontradoException(codigo);
			
		}
	}
	
	public AssistenteSocial buscarOuFalharAssistenteSocialSemComplementos(String codigo) {
		
			return assistenteSocialRepository.findByCodigo(codigo)
												.orElseThrow(() -> new AssistenteSocialNaoEncontradoException(codigo));
			
	}

}