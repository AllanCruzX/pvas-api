package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Repository
public interface IdiomaRepository extends CrudRepository<Idioma, Long>  {
	
	@Query(" SELECT a FROM AssistenteSocial a INNER JOIN FETCH a.idiomas WHERE a.codigo = :codigoAssistenteSocial")
	Optional<AssistenteSocial> lirtarIdiomasDaAssistenteSocial(String codigoAssistenteSocial);
}
