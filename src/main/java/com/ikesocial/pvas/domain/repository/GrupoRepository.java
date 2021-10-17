package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Grupo;

@Repository
public interface GrupoRepository extends CrudRepository<Grupo, Long>  {
	
	@Query(" SELECT a FROM AssistenteSocial a INNER JOIN FETCH a.grupos ag INNER JOIN FETCH ag.permissoes WHERE a.codigo = :codigoAssistenteSocial")
	Optional<AssistenteSocial> lirtarGruposDaAssistenteSocial(String codigoAssistenteSocial);
	
}
