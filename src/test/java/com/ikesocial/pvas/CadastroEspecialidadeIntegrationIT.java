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
import com.ikesocial.pvas.domain.repository.EspecialidadeRepository;
import com.ikesocial.pvas.util.DatabaseCleaner;
import com.ikesocial.pvas.util.ResourceUtils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("/application-test.properties")
class CadastroEspecialidadeIntegrationIT {
	
	private static final int ESPECIALIDADE_ID_INEXISTENTE = 100;
	
	@LocalServerPort
	private int port;
	
	@Autowired
	private DatabaseCleaner databaseCleaner;
	
	@Autowired
	private EspecialidadeRepository especialidadeRepository;
	
	private Especialidade especialidadeAssistencia;
	private String jsonCorretoEspecialidadeSaude;
	private String jsonIncoretoNomeNull;
	private int quantidadeEspecialidadesCadastradas;
	
	@BeforeEach
	public void setUp() {
		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		RestAssured.port = port;
		RestAssured.basePath = "/especialidades";
		
		databaseCleaner.clearTables();
		
		prepararDados();
		
		this.jsonCorretoEspecialidadeSaude = ResourceUtils.getContentFromResource("/json/especialidades/correto/saude.json");
		this.jsonIncoretoNomeNull = ResourceUtils.getContentFromResource("/json/especialidades/incorreto/nome-null.json");

		
	}
	
	@Test
	public void deveRetornarStatus200_QuandoConsultarEspecialidades() {
		
		RestAssured
		.given()
			.accept(ContentType.JSON)
		.when()
			.get()
		.then()
			.statusCode(HttpStatus.OK.value());
	}

	@Test
	public void deveRetornarStatus201_QuandoCadastrarEspecialidade() {
		
		RestAssured.given()
				.body(this.jsonCorretoEspecialidadeSaude)
				.contentType(ContentType.JSON)
				.accept(ContentType.JSON)
			.when()
				.post()
			.then()
		.statusCode(HttpStatus.CREATED.value());
		
	}
	
	@Test
	public void deveRetornarStatus400_QuandoCadastrarEspecialidadeComNomeNull() {
		RestAssured.given()
			.body(this.jsonIncoretoNomeNull)
			.contentType(ContentType.JSON)
			.accept(ContentType.JSON)
		.when()
			.post()
		.then()
			.statusCode(HttpStatus.BAD_REQUEST.value());
	}
	
	@Test
	public void deveRetornarQuantidadeCorretaDeEspecialidades_QuandoConsultarEspecilidades() {
		
		RestAssured.given()
	        .accept(ContentType.JSON)
	    .when()
	        .get()
	    .then()
	        .body("", Matchers.hasSize(this.quantidadeEspecialidadesCadastradas));
		
	}
	
	@Test
	public void deveRetornarRespostaEstatusCorretos_QuandoConsultarEspecialidadeExistente() {
		
		RestAssured.given()
			.pathParam("especialidadeId", especialidadeAssistencia.getId())
			.accept(ContentType.JSON)
		.when()
			.get("/{especialidadeId}")
		.then()
        	.statusCode(HttpStatus.OK.value())
        	.body("nome", Matchers.equalTo(especialidadeAssistencia.getNome()));
		
	}
	
	
	@Test
	public void deveRetornarStatus404_QuandoConsultarEspecialidadeInexistente() {
		
		RestAssured.given()
			.pathParam("especialidadeId", ESPECIALIDADE_ID_INEXISTENTE)
			.accept(ContentType.JSON)
		.when()
			.get("/{especialidadeId}")
		.then()
        	.statusCode(HttpStatus.NOT_FOUND.value());
		
	}
	

	
	private void prepararDados() {
		Especialidade especialidadeEducacao = new Especialidade();
		especialidadeEducacao.setNome("EDUCACAO");
		especialidadeRepository.save(especialidadeEducacao);
		
		especialidadeAssistencia = new Especialidade();
		especialidadeAssistencia.setNome("ASSISTENCIA");
		especialidadeRepository.save(especialidadeAssistencia);
		
		this.quantidadeEspecialidadesCadastradas = (int) especialidadeRepository.count();
		
	}

}
