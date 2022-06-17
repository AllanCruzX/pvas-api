package com.ikesocial.pvas;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Stream;

import org.assertj.core.util.Sets;
import org.hamcrest.Matchers;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.security.oauth2.client.servlet.OAuth2ClientAutoConfiguration;
import org.springframework.boot.autoconfigure.security.oauth2.resource.servlet.OAuth2ResourceServerAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.security.oauth2.client.test.OAuth2ContextConfiguration;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.TokenRequest;
import org.springframework.security.oauth2.provider.client.BaseClientDetails;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.ikesocial.pvas.domain.builder.ContatoBuilder;
import com.ikesocial.pvas.domain.builder.DocumentoBuilder;
import com.ikesocial.pvas.domain.builder.EnderecoBuilder;
import com.ikesocial.pvas.domain.builder.ProfissionalBuilder;
import com.ikesocial.pvas.domain.enums.Sexo;
import com.ikesocial.pvas.domain.enums.TipoContato;
import com.ikesocial.pvas.domain.enums.TipoDocumento;
import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.model.Estado;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.repository.CidadeRepository;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;
import com.ikesocial.pvas.util.DatabaseCleaner;
import com.ikesocial.pvas.util.ResourceUtils;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;

@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("/application-test.properties")
@EnableAutoConfiguration(exclude = {SecurityAutoConfiguration.class , OAuth2ClientAutoConfiguration.class,OAuth2ResourceServerAutoConfiguration.class})
class CadastroProfissionalIntegrationIT {

	@LocalServerPort
	private int port;

	@Autowired
	private DatabaseCleaner databaseCleaner;

	@Autowired
	private ProfissionalRepository profissionalRepository;
	
	@Autowired
    private TokenStore tokenStore;

	private Profissional profissional;
	private String jsonCorretoProfissional;
	private String jsonIncoretoNomeNull;
	private int quantidadeDeProfissionaisCadastrados;

	@BeforeEach
	public void setUp() {

		final OAuth2AccessToken token = new DefaultOAuth2AccessToken("FOO");
		final ClientDetails client = new BaseClientDetails("client", null, "read", "client_credentials", "ROLE_CLIENT");
		final OAuth2Authentication authentication = new OAuth2Authentication(
				new TokenRequest(null, "client", null, "client_credentials").createOAuth2Request(client), null);

		tokenStore.storeAccessToken(token, authentication);

		RestAssured.enableLoggingOfRequestAndResponseIfValidationFails();
		RestAssured.port = port;
		RestAssured.basePath = "/especialidades";

		databaseCleaner.clearTables();

		prepararDados();

		this.jsonCorretoProfissional = ResourceUtils
				.getContentFromResource("/json/profissionais/correto/profissional.json");
		this.jsonIncoretoNomeNull = ResourceUtils
				.getContentFromResource("/json/profissionais/incorreto/nome-null.json");

	}

	@Test
	public void deveRetornarStatus200_QuandoConsultarProfissional() {

		RestAssured.given().accept(ContentType.JSON).when().get().then().statusCode(HttpStatus.OK.value());
	}

	@Test
	public void deveRetornarStatus201_QuandoCadastrarProfissional() {

		RestAssured.given().body(this.jsonCorretoProfissional).contentType(ContentType.JSON).accept(ContentType.JSON)
				.when().post().then().statusCode(HttpStatus.CREATED.value());

	}

//	@Test
//	public void deveRetornarStatus400_QuandoCadastrarEspecialidadeComNomeNull() {
//		RestAssured.given()
//			.body(this.jsonIncoretoNomeNull)
//			.contentType(ContentType.JSON)
//			.accept(ContentType.JSON)
//		.when()
//			.post()
//		.then()
//			.statusCode(HttpStatus.BAD_REQUEST.value());
//	}
//	
//	@Test
//	public void deveRetornarQuantidadeCorretaDeEspecialidades_QuandoConsultarEspecilidades() {
//		
//		RestAssured.given()
//	        .accept(ContentType.JSON)
//	    .when()
//	        .get()
//	    .then()
//	        .body("", Matchers.hasSize(this.quantidadeEspecialidadesCadastradas));
//		
//	}
//	
//	@Test
//	public void deveRetornarRespostaEstatusCorretos_QuandoConsultarEspecialidadeExistente() {
//		
//		RestAssured.given()
//			.pathParam("especialidadeId", especialidadeAssistencia.getId())
//			.accept(ContentType.JSON)
//		.when()
//			.get("/{especialidadeId}")
//		.then()
//        	.statusCode(HttpStatus.OK.value())
//        	.body("nome", Matchers.equalTo(especialidadeAssistencia.getNome()));
//		
//	}
//	
//	
//	@Test
//	public void deveRetornarStatus404_QuandoConsultarEspecialidadeInexistente() {
//		
//		RestAssured.given()
//			.pathParam("especialidadeId", ESPECIALIDADE_ID_INEXISTENTE)
//			.accept(ContentType.JSON)
//		.when()
//			.get("/{especialidadeId}")
//		.then()
//        	.statusCode(HttpStatus.NOT_FOUND.value());
//		
//	}

	private void prepararDados() {

		Contato celular = new ContatoBuilder().comDescricao("71992587320").comTipoContato(TipoContato.CELULAR)
				.construir();

		Contato email = new ContatoBuilder().comDescricao("ivo@email.com").comTipoContato(TipoContato.EMAIL)
				.construir();

		Set<Contato> contatos = new HashSet<Contato>(Arrays.asList(email));

		Estado estado = new Estado();
		estado.setNome("Bahia");
		estado.setSigla("BA");

		Cidade cidade = new Cidade();
		cidade.setEstado(estado);
		cidade.setNome("Salvador");

		// cidade = cidadeRepository.save(cidade);

		Endereco endereco = new EnderecoBuilder().comCep("41500350").comLogradouro("Rua São Gerado")
				.comBairro("São Cristovão").comNumero("533").comComplemento("Ap 14").comCidade(cidade)
				.definirComoResidencial().construir();

		Set<Endereco> enderecos = new HashSet<Endereco>();
		enderecos.add(endereco);

		Documento docmento = new DocumentoBuilder().comCodigo("64183950007").comTipoDocumento(TipoDocumento.CPF)
				.construir();

		Set<Documento> docmentos = new HashSet<Documento>();
		docmentos.add(docmento);

		Profissional profissional = new ProfissionalBuilder().comNome("Ivo Cruz").comNomeMae("Waldelice")
				.comSenha("123").eCasado().sexo(Sexo.MASCULINO).comComtatos(contatos).comDocumentos(docmentos)
				.comEnderecos(enderecos).construir();

		profissionalRepository.save(profissional);
	}

}
