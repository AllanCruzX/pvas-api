package com.ikesocial.pvas.core.security.authorizationserver;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.ikesocial.pvas.domain.model.Pessoa;

import lombok.Getter;

@Getter
public class AuthUser extends User {

	private static final long serialVersionUID = 1L;
	
	private String fullName;
	private String codigo;
	
	public AuthUser(Pessoa usuario , Collection<? extends GrantedAuthority> authorities) {
		
		super(usuario.getEmail().getDescricao(), usuario.getSenha(), authorities);
		
		this.fullName = usuario.getNome();
		this.codigo = usuario.getCodigo();
	}
	
}
