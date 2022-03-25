package com.ikesocial.pvas.core.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

import com.ikesocial.pvas.domain.repository.ProfissionalRepository;

@Component
public class PvasSecurity {

	@Autowired
	private ProfissionalRepository profissionalRepository;

//	@Autowired
//	private CursoRepository cursoRepository;
//
//	@Autowired
//	private ExperienciaProfissionalRepository experienciaProfissionalRepository;

	public Authentication getAuthentication() {
		return SecurityContextHolder.getContext().getAuthentication();
	}

	public String getUsuarioCodigo() {
		Jwt jwt = (Jwt) getAuthentication().getPrincipal();

		return jwt.getClaim("usuario_codigo");
	}

	public boolean oProfissionalPodeGereciarSeuDados(String codigoDoProfissional) {

		return codigoDoProfissional != null && getUsuarioCodigo() != null
				&& profissionalRepository.existeProfissionalNoBanco(codigoDoProfissional)
				&& codigoDoProfissional.equals(getUsuarioCodigo());
	}

//	public boolean oProfissionalPodeGereciarSeuCurso(Long cursoId) {
//
//		return cursoId != null && cursoRepository.existeNoBanco(getUsuarioCodigo(), cursoId);
//
//	}

//	public boolean oProfissionalPodeGereciarSuaExperieciaProfissional(Long experienciaProfissionalId) {
//
//		return experienciaProfissionalRepository.existeNoBanco(getUsuarioCodigo(), experienciaProfissionalId);
//
//	}

	public boolean hasAuthority(String authorityName) {
		return getAuthentication().getAuthorities().stream()
				.anyMatch(authority -> authority.getAuthority().equals(authorityName));
	}

	public boolean podeConsultarProfissionais() {
		return hasAuthority("CONSULTAR_PROFISSIONAIS");
	}

	public boolean podeConsultarGruposPermissoes() {
		return hasAuthority("CONSULTAR_GRUPOS_PERMISSOES");
	}
	
	public boolean podeConsultarRelatorios() {
		return hasAuthority("GERAR_RELATORIOS");
	}

}
