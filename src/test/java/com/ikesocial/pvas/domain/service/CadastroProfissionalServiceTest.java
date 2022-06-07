package com.ikesocial.pvas.domain.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.fail;
import static org.mockito.Mockito.verify;

import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.ikesocial.pvas.domain.exception.CidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.exception.ProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;

class CadastroProfissionalServiceTest {

	@InjectMocks
	private CadastroProfissionalService cadastroProfissionalService;

	@Mock
	private ProfissionalRepository profissionalRepository;

	@Mock
	private PasswordEncoder passwordEncoder;

	Profissional profissional;
	String senhaAtual;
	String novaSenha;

	@BeforeEach
	public void setup() {

		MockitoAnnotations.initMocks(this);
		String codigo = "84546946546945L";
		profissional = new Profissional();
		profissional.setCodigo(codigo);
	}

	@Test
	public void deveAlterarSenhaComSucesso() {

		iniciaSenhasDoProfissional();

		Mockito.when(profissionalRepository.findByCodigo(profissional.getCodigo()))
				.thenReturn(Optional.of(profissional));
		Mockito.when(passwordEncoder.matches(senhaAtual, profissional.getSenha())).thenReturn(true);
		Mockito.when(passwordEncoder.encode(novaSenha)).thenReturn("nova123456789");

		// acao
		cadastroProfissionalService.alterarSenha(profissional.getCodigo(), senhaAtual, novaSenha);

		// verificacao
		verify(profissionalRepository).findByCodigo(profissional.getCodigo());
		assertEquals(profissional.getSenha(), "nova123456789");
	}

	@Test
	public void noaDevePermitirAlterarSenhaQueNaoCoincide() {

		// Cenario

		iniciaSenhasDoProfissional();

		Mockito.when(profissionalRepository.findByCodigo(profissional.getCodigo()))
				.thenReturn(Optional.of(profissional));

		// acao

		try {
			cadastroProfissionalService.alterarSenha(profissional.getCodigo(), senhaAtual, novaSenha);
			fail();
		} catch (NegocioException e) {
			assertEquals(e.getMessage(), "Senha atual informada nao coincide com a senha do profissional.");
		}

	}

	@Test
	public void inativarProfissionalComSucesso() {

		// Cenario
		
		Mockito.when(profissionalRepository.findByCodigo(profissional.getCodigo()))
		.thenReturn(Optional.of(profissional));

		// Acao
		
		cadastroProfissionalService.inativar(profissional.getCodigo());

		// Verificacao
		verify(profissionalRepository).findByCodigo(profissional.getCodigo());
		assertFalse(profissional.getAtivo());
		assertTrue(profissional.getDataIntivacao() != null);

	}
	
	@Test
	public void ativarProfissionalComSucesso() {

		// Cenario
		
		Mockito.when(profissionalRepository.findByCodigo(profissional.getCodigo()))
		.thenReturn(Optional.of(profissional));

		// Acao
		
		cadastroProfissionalService.ativar(profissional.getCodigo());

		// Verificacao
		verify(profissionalRepository).findByCodigo(profissional.getCodigo());
		assertTrue(profissional.getAtivo());
		assertTrue(profissional.getDataIntivacao() == null);

	}
	
	@Test
	void buscaLazyProfissionalComErro() {
		
		assertThrows(ProfissionalNaoEncontradoException.class, () -> {
			
			Mockito.when(cadastroProfissionalService.buscarOuFalharLazy(profissional.getCodigo())).thenThrow(ProfissionalNaoEncontradoException.class);
		});
		
	}
	
	
	@Test
	void buscaEagerProfissionalComErro() {
		
		assertThrows(ProfissionalNaoEncontradoException.class, () -> {
			
			Mockito.when(cadastroProfissionalService.buscarOuFalharEager(profissional.getCodigo())).thenThrow(ProfissionalNaoEncontradoException.class);
		});
		
	}
	
	private void iniciaSenhasDoProfissional() {
		senhaAtual = "123456";
		novaSenha = "123456789";
		profissional.setSenha("$12$/7XNM63m6GY4HthdbCXN6evfw4/JhrK1QbCKcbD2PpwbM5kMLhiH.");
	}
}
