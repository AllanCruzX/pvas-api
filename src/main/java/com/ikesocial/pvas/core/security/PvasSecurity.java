package com.ikesocial.pvas.core.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;
import com.ikesocial.pvas.domain.repository.CursoRepository;
import com.ikesocial.pvas.domain.repository.ExperienciaProfissionalRepository;

@Component
public class PvasSecurity {

	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;

	@Autowired
	private CursoRepository cursoRepository;

	@Autowired
	private ExperienciaProfissionalRepository experienciaProfissionalRepository;

	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	public String getUsuarioCodigo() {
		Jwt jwt = (Jwt) getAuthentication().getPrincipal();

		return jwt.getClaim("usuario_codigo");
	}

	public boolean oAssistenteSocialPodeGereciarSeuDados(String codigoAssistenteSocial) {

		return codigoAssistenteSocial != null && getUsuarioCodigo() != null
				&& assistenteSocialRepository.existeAssitenteSocialNoBanco(codigoAssistenteSocial)
				&& codigoAssistenteSocial.equals(getUsuarioCodigo());
	}

	public boolean oAssistenteSocialPodeGereciarSeuCurso(Long cursoId) {

		return cursoId != null && cursoRepository.existeNoBanco(getUsuarioCodigo(), cursoId);

	}

	public boolean oAssistenteSocialPodeGereciarSuaExperieciaProfissional(Long experienciaProfissionalId) {

		return experienciaProfissionalRepository.existeNoBanco(getUsuarioCodigo(), experienciaProfissionalId);

	}

	public boolean hasAuthority(String authorityName) {
		return getAuthentication().getAuthorities().stream()
				.anyMatch(authority -> authority.getAuthority().equals(authorityName));
	}

	public boolean podeConsultarAssistentesSociais() {
		return hasAuthority("CONSULTAR_ASSISTENTE_SOCIAIS");
	}

	public boolean podeConsultarGruposPermissoes() {
		return hasAuthority("CONSULTAR_GRUPOS_PERMISSOES");
	}
	
	public boolean podeConsultarRelatorios() {
		return hasAuthority("GERAR_RELATORIOS");
	}

}
