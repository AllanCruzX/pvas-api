package com.ikesocial.pvas.domain.repository;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Usuario;

@Repository
public interface UsuarioRepository extends CustomJpaRepository<Usuario, Long>, UsuarioRepositoryQueries,
		JpaSpecificationExecutor<Usuario> {
	

}
