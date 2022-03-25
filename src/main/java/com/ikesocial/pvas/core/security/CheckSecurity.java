package com.ikesocial.pvas.core.security;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;

public class CheckSecurity {

	public @interface Profissionais {
		
		
		//@PreAuthorize("hasAuthority('SCOPE_WRITE') and hasAuthority('INATIVAR_ATIVAR_ASSISTENTE_SOCIAIS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuDados(#codigoAssistenteSocial)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeExcluir {
		}

		@PreAuthorize("hasAuthority('SCOPE_WRITE') and hasAuthority('INATIVAR_ATIVAR_PROFISSIONAIS') or @pvasSecurity.oProfissionalPodeGereciarSeuDados(#codigoDoProfissional)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeAtivarOuInativar {
		}

		@PreAuthorize(" hasAuthority('SCOPE_WRITE') and hasAuthority('CADASTRAR_PROFISSIONAIS') ")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeCadastrar {
		}

		@PreAuthorize(" hasAuthority('SCOPE_WRITE') and hasAuthority('EDITAR_PROFISSIONAIS') or @pvasSecurity.oProfissionalPodeGereciarSeuDados(#codigoDoProfissional)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeEditar {
		}

		@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_PROFISSIONAIS')")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeConsultar {
		}
		
		@PreAuthorize("hasAuthority('SCOPE_READ') and isAuthenticated()")
		@PostAuthorize("hasAuthority('BUSCAR_PROFISSIONAL') or @pvasSecurity.getUsuarioCodigo().equals(returnObject.codigo)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeBuscar {
			
		}
		
		@PreAuthorize("hasAuthority('SCOPE_READ') and isAuthenticated()")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface EstaAutorizado {
			
		}
		
		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_ASSISTENTE_SOCIAIS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuDados(#codigoAssistenteSocial)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface EstaAutorizadoPersonalizado {
			
		}

	}


	public @interface Relatorios {

		@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('GERAR_RELATORIOS')")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeConsultar {
		}

	}
	
	public @interface Grupos {

		@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_GRUPOS_PERMISSOES')")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeConsultar {
		}

	}
	
	
	public @interface Cursos {
		
		//@PreAuthorize("hasAuthority('SCOPE_WRITE') and hasAuthority('EXCLUIR_CURSOS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuCurso(#cursoId)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeExcluir {
		}

		//@PreAuthorize(" hasAuthority('SCOPE_WRITE') and hasAuthority('CADASTRAR_CURSOS') ")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeCadastrar {
		}

		//@PreAuthorize(" hasAuthority('SCOPE_WRITE') and hasAuthority('EDITAR_ASSISTENTE_SOCIAIS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuCurso(#cursoId)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeEditar {
		}

		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_CURSOS')")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeConsultar {
		}
		
		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_CURSOS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuCurso(#cursoId)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeBuscar {
			
		}
		
		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_CURSOS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuDados(#codigoAssistenteSocial)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeBuscarPersonalizado {
			
		}

	}
	

	public @interface ExperienciasProfissionais {
		
		//@PreAuthorize("hasAuthority('SCOPE_WRITE') and hasAuthority('EXCLUIR_EXPERIENCIAS_PROFISSIONAIS') or @pvasSecurity.oAssistenteSocialPodeGereciarSuaExperieciaProfissional(#experienciaProfissionalId)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeExcluir {
		}

		//@PreAuthorize(" hasAuthority('SCOPE_WRITE') and hasAuthority('CADASTRAR_EXPERIENCIAS_PROFISSIONAIS') ")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeCadastrar {
		}

		//@PreAuthorize(" hasAuthority('SCOPE_WRITE') and hasAuthority('EDITAR_EXPERIENCIAS_PROFISSIONAIS') or @pvasSecurity.oAssistenteSocialPodeGereciarSuaExperieciaProfissional(#experienciaProfissionalId)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeEditar {
		}

		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_EXPERIENCIAS_PROFISSIONAIS')")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeConsultar {
		}
		
		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_EXPERIENCIAS_PROFISSIONAIS') or @pvasSecurity.oAssistenteSocialPodeGereciarSuaExperieciaProfissional(#experienciaProfissionalId)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeBuscar {
			
		}
		
		//@PreAuthorize("hasAuthority('SCOPE_READ') and hasAuthority('CONSULTAR_CURSOS') or @pvasSecurity.oAssistenteSocialPodeGereciarSeuDados(#codigoAssistenteSocial)")
		@Retention(RUNTIME)
		@Target(METHOD)
		public @interface PodeBuscarPersonalizado {
			
		}

	}
	

}
