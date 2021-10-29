package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ikesocial.pvas.domain.filter.UsuarioFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.Usuario;

public interface UsuarioRepositoryQueries {
	
	Page<Usuario> listarComFiltro(UsuarioFilter usuarioFilter ,  Pageable pageRequest);
	
	Page<Usuario> listarComFiltroAtivos(UsuarioFilter usuarioFilter ,  Pageable pageRequest);
	
	Optional<Usuario> buscarPorCodigo(String codigo);

	FotoPessoa save (FotoPessoa foto);
	
	void delete(FotoPessoa foto);
}
