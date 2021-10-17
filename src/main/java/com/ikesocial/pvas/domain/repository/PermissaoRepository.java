package com.ikesocial.pvas.domain.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Permissao;

@Repository
public interface PermissaoRepository extends CrudRepository<Permissao, Long>  {
	
}
