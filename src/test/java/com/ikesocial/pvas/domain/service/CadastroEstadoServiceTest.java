package com.ikesocial.pvas.domain.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.OffsetDateTime;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.repository.EstadoRepository;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class CadastroEstadoServiceTest {
	
	@InjectMocks
	private CadastroEstadoService cadastroEstadoService;
	
	@Mock
	private EstadoRepository estadoRepository;
	
	Estado estado ;
	
	
	@BeforeEach
	public void beforeEach() {
		estado = criaEstadoMock();
	}

	@Test
	void cadatraUmaEstadoComSucesso() {
		
		cadastroEstadoService.salvar(estado);
		
		Mockito.verify(estadoRepository).save(estado);
		
	}
	
	@Test
	void buscarOuFalharComSucesso() {
		
		Mockito.when(estadoRepository.findById(estado.getId())).thenReturn(Optional.of(estado));
		
		assertEquals(1L, estado.getId());
		
	}
	
	
	private Estado criaEstadoMock() {

		Estado estado = new Estado();
		estado.setId(1L);
		estado.setNome("Bahia");
		estado.setSigla("BA");
		estado.setDataAtualizacao(OffsetDateTime.now());

		return estado;
	}

}
