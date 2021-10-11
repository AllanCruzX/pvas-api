package com.ikesocial.pvas.core.openapi;

import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.net.URL;
import java.net.URLStreamHandler;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.classmate.TypeResolver;
import com.ikesocial.pvas.api.exceptionhandler.Problem;
import com.ikesocial.pvas.api.model.output.AssistenteSocialResumoModel;
import com.ikesocial.pvas.api.openapi.model.AssistenteSociaisModelOpenApi;
import com.ikesocial.pvas.api.openapi.model.PageableModelOpenApi;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RepresentationBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseBuilder;
import springfox.documentation.schema.AlternateTypeRules;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Response;
import springfox.documentation.service.Tag;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
@Import({ springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration.class})
public class SpringFoxConfig implements WebMvcConfigurer  {

	 	@Bean
	    public Docket apiDocket() {
	 		TypeResolver typeResolver = new TypeResolver();
	 		
	        return new Docket(DocumentationType.OAS_30)
	        		.select()
					.apis(RequestHandlerSelectors.basePackage("com.ikesocial.pvas.api"))
					.paths(PathSelectors.any())
					.build()
				.useDefaultResponseMessages(false)
				.globalResponses(HttpMethod.GET, globalGetResponseMessages())
				.globalResponses(HttpMethod.POST, globalPostPutResponseMessages())
				.globalResponses(HttpMethod.PUT, globalPostPutResponseMessages())
				.globalResponses(HttpMethod.DELETE, globalDeleteResponseMessages())
				.ignoredParameterTypes(ServletWebRequest.class,
						URL.class, URI.class, URLStreamHandler.class, Resource.class,
						File.class, InputStream.class)
				.directModelSubstitute(Pageable.class, PageableModelOpenApi.class)
				.alternateTypeRules(AlternateTypeRules.newRule(
						typeResolver.resolve(Page.class, AssistenteSocialResumoModel.class),
						AssistenteSociaisModelOpenApi.class))
				.apiInfo(apiInfo())
				.additionalModels(typeResolver.resolve(Problem.class))
				.tags(new Tag("Cidades", "Gerencia as cidades"),
					  new Tag("Estados", "Gerencia os estados"),
					  new Tag("Enderecos", "Consulta os endereços"),
					  new Tag("Especialidades", "Gerencia as especialidades"),
					  new Tag("Cursos", "Gerencia os cursos"),
					  new Tag("SubEspecialidades", "Gerencia as subespecialidades"),
					  new Tag("Estatísticas", "Estatísticas da PVAS"),
				 	  new Tag("Assistentes Sociais", "Gerencia as sssistentes sociais"));
	        
	    }
	 	
	 	private List<Response> globalGetResponseMessages() {
			return Arrays.asList(
					new ResponseBuilder()
							.code(comoString(HttpStatus.INTERNAL_SERVER_ERROR))
							.description("Erro interno do Servidor")
							.representation( MediaType.APPLICATION_JSON )
							.apply(problemBuilder())
							.build(),
					new ResponseBuilder()
							.code(comoString(HttpStatus.NOT_ACCEPTABLE))
							.description("Recurso não possui representação que pode ser aceita pelo consumidor")
							.build()
			);
		}
	 	
		private List<Response> globalDeleteResponseMessages() {
			return Arrays.asList(
					new ResponseBuilder()
							.code(comoString(HttpStatus.INTERNAL_SERVER_ERROR))
							.description("Erro interno do Servidor")
							.representation( MediaType.APPLICATION_JSON )
							.apply(problemBuilder())
							.build(),
					new ResponseBuilder()
							.code(comoString(HttpStatus.BAD_REQUEST))
							.description("Requisição inválida (erro do cliente)")
							.representation( MediaType.APPLICATION_JSON )
							.apply(problemBuilder())
							.build()
			);
		}
		
		private List<Response> globalPostPutResponseMessages() {
			return Arrays.asList(
					new ResponseBuilder()
							.code(comoString(HttpStatus.INTERNAL_SERVER_ERROR))
							.description("Erro interno do Servidor")
							.representation( MediaType.APPLICATION_JSON )
							.apply(problemBuilder())
							.build(),
					new ResponseBuilder()
							.code(comoString(HttpStatus.NOT_ACCEPTABLE))
							.description("Recurso não possui representação que pode ser aceita pelo consumidor")
							.build(),
					new ResponseBuilder()
							.code(comoString(HttpStatus.BAD_REQUEST))
							.description("Requisição inválida (erro do cliente)")
							.representation( MediaType.APPLICATION_JSON )
							.apply(problemBuilder())
							.build(),
					new ResponseBuilder()
							.code(comoString(HttpStatus.UNSUPPORTED_MEDIA_TYPE))
							.description("Requisição recusada porque o corpo está em um formato não suportado")
							.representation( MediaType.APPLICATION_JSON )
							.apply(problemBuilder())
							.build()
			);
		}
		
		private String comoString(HttpStatus httpStatus) {
			return String.valueOf(httpStatus.value());
		}
		
		private Consumer<RepresentationBuilder> problemBuilder() {
			return r -> r.model(m -> m.name("Problema")
					.referenceModel(
							ref -> ref.key(
									k -> k.qualifiedModelName(
											q -> q.name("Problema")
												  .namespace("com.ikesocial.pvas.api.exceptionhandler")
									))));
		}
	 
	 	private ApiInfo apiInfo() {
			return new ApiInfoBuilder()
					.title("PVAS API")
					.description("API - plataforma de visibilidade para assistentes sociais")
					.version("1")
					.contact(new Contact("Ike Social", "https://ikesocial.com/", "suporte@ikesocial.com "))
					.build();
		}
	 
	 @Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
		    registry.addResourceHandler("index.html")
		    	.addResourceLocations("classpath:/META-INF/resources/");

		}

}
