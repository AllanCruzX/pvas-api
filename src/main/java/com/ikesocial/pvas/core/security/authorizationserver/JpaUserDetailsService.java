package com.ikesocial.pvas.core.security.authorizationserver;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.model.Pessoa;
import com.ikesocial.pvas.domain.repository.PessoaRepository;

@Service
public class JpaUserDetailsService implements UserDetailsService {

	@Autowired
	private PessoaRepository pessoaRepository;

	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		 Pessoa pessoa = pessoaRepository.buscarPessoaPorEmail(username)
				 			.orElseThrow(() -> new UsernameNotFoundException("Usuário não encontrado com e-mail informado"));
		 
		 return new AuthUser(pessoa , getAuthorities(pessoa));
	}
	
	private Collection<GrantedAuthority> getAuthorities(Pessoa pessoa) {
		return pessoa.getGrupos().stream()
				.flatMap(grupo -> grupo.getPermissoes().stream())
				.map(permissao -> new SimpleGrantedAuthority(permissao.getNome().toUpperCase()))
				.collect(Collectors.toSet());
	}

}
