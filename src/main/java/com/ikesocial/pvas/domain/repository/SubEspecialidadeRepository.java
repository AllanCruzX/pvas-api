package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.SubEspecialidade;

@Repository
public interface SubEspecialidadeRepository extends CrudRepository<SubEspecialidade, Long>{
	
	@Query(" SELECT a FROM AssistenteSocial a INNER JOIN FETCH a.subEspecialidades WHERE a.codigo = :codigoAssistenteSocial")
	Optional<AssistenteSocial> lirtarSubEspecialidadesDaAssistenteSocial(String codigoAssistenteSocial);

}
