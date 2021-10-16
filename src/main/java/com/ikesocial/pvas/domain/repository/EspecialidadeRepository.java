package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Repository
public interface EspecialidadeRepository extends JpaRepository<Especialidade, Long>{
	
	@Query(" SELECT a FROM AssistenteSocial a INNER JOIN FETCH a.idiomas WHERE a.codigo = :codigoAssistenteSocial")
	Optional<AssistenteSocial> lirtarEspecialidadesDaAssistenteSocial(String codigoAssistenteSocial);

}
