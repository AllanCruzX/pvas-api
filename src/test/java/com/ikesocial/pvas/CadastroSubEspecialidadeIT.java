package com.ikesocial.pvas;

import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.util.DatabaseCleaner;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("/application-test.properties")
public class CadastroSubEspecialidadeIT {
	
	private static final int SUB_ESPECIALIDADE_ID_INEXISTENTE = 100;
	
	@LocalServerPort
	private int port;
	
	@Autowired
	private DatabaseCleaner databaseCleaner;
	
	
	private SubEspecialidade subEspecialidadeAtencaoDomiciliar;
	
	@BeforeEach
	public void setUp() {
		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		RestAssured.port = port;
		RestAssured.basePath = "/subespecialidades";
		
		databaseCleaner.clearTables();
		
		prepararDados();
		
	}
	
	@Test
	public void deveRetonarStatus200_quandoConsultarEspecialidades() {
		RestAssured
		.given()
			.accept(ContentType.JSON)
		.when()
			.get()
		.then()
			.statusCode(HttpStatus.OK.value());
	}
	
	
	@Test
	public void deveRetornarRespostaEstatusCorretos_QuandoConsultarSubEspecialidadeExistente() {
		
		RestAssured.given()
			.pathParam("subEspecialidadeId", subEspecialidadeAtencaoDomiciliar.getId())
			.accept(ContentType.JSON)
		.when()
			.get("/{subEspecialidadeId}")
		.then()
        	.statusCode(HttpStatus.OK.value())
        	.body("nome", Matchers.equalTo(subEspecialidadeAtencaoDomiciliar.getNome()));
		
	}
	
	@Test
	public void deveRetornarStatus404_QuandoConsultarSubEspecialidadeInexistente() {
		
		RestAssured.given()
			.pathParam("subEspecialidadeId", SUB_ESPECIALIDADE_ID_INEXISTENTE)
			.accept(ContentType.JSON)
		.when()
			.get("/{subEspecialidadeId}")
		.then()
        	.statusCode(HttpStatus.NOT_FOUND.value());
		
	}

	private void prepararDados() {
		
		Especialidade especialidadeSaude = new Especialidade();
		especialidadeSaude.setNome("SAUDE");
		//especialidadeSaude = especialidadeRepository.save(especialidadeSaude);
		
		Especialidade especialidadeEducacao = new Especialidade();
		especialidadeEducacao.setNome("EDUCACAO");
		//especialidadeEducacao = especialidadeRepository.save(especialidadeEducacao);
		
		subEspecialidadeAtencaoDomiciliar = new SubEspecialidade();
		subEspecialidadeAtencaoDomiciliar.setNome("ATECAO DOMICILIAR");
		subEspecialidadeAtencaoDomiciliar.setEspecialidade(especialidadeSaude);
		//subEspecialidadeRepository.save(subEspecialidadeAtencaoDomiciliar);
		
		SubEspecialidade subEspecialidadeApoioEscolar = new SubEspecialidade();
		subEspecialidadeApoioEscolar.setNome("APOIO ESCOLAR");
		subEspecialidadeApoioEscolar.setEspecialidade(especialidadeEducacao);
		//subEspecialidadeRepository.save(subEspecialidadeApoioEscolar);
		
	}

}
