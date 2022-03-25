package com.ikesocial.pvas.domain.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.OffsetDateTime;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import org.mockito.junit.jupiter.MockitoSettings;
import org.mockito.quality.Strictness;

import com.ikesocial.pvas.domain.exception.CidadeNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.repository.CidadeRepository;
import com.ikesocial.pvas.domain.repository.EstadoRepository;

@ExtendWith(MockitoExtension.class)
@MockitoSettings(strictness = Strictness.LENIENT)
class CadastroCidadeServiceTest {

	@InjectMocks
	private CadastroCidadeService cidadeService;

	@Mock
	private CidadeRepository cidadeRepository;

	@Mock
	private CadastroEstadoService estadoService;
	
	@Mock
	private EstadoRepository estadoRepository;
	
	Estado estado;
	
	Cidade cidade;
	
	
	@BeforeEach
	public void beforeEach() {
		estado = criaEstadoMock();
		cidade = criaCidadeMock();
	}
	

	@Test
	void cadatraUmaCidadeComSucesso() {
		
		Mockito.when(estadoService.buscarOuFalhar(estado.getId())).thenReturn(estado);
		
		cidadeService.salvar(cidade);
		
		assertEquals(1L, cidade.getEstado().getId());
		
		Mockito.verify(cidadeRepository).save(cidade);
		
	}
	
	@Test
	void buscaUmCidadeComErro() {
		
		assertThrows(CidadeNaoEncontradoException.class, () -> {
			
			Mockito.when(cidadeService.buscarOuFalhar(1L)).thenThrow(CidadeNaoEncontradoException.class);
		});
		
	}

	private Cidade criaCidadeMock() {

		Cidade cidade = new Cidade();
		cidade.setNome("Salvador");
		cidade.setEstado(criaEstadoMock());
		
		return cidade;
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
