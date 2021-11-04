package com.ikesocial.pvas.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

@Repository
public interface ExperienciaProfissionalRepository extends CustomJpaRepository<ExperienciaProfissional, Long>{
	
	@Query(" SELECT e FROM ExperienciaProfissional e  WHERE e.assistenteSocial.codigo = :codigoAssistenteSocial ")
	List<ExperienciaProfissional> lirtarExperienciaProfissionalDaAssistenteSocial(String codigoAssistenteSocial);
	
	@Query(" SELECT e FROM ExperienciaProfissional e LEFT JOIN FETCH e.assistenteSocial WHERE e.id = :experienciaProfissionalId ")
	Optional<ExperienciaProfissional> buscarExperienciaProfissionalComAssistenteSocial(Long experienciaProfissionalId);
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM ExperienciaProfissional e WHERE e.id = :experienciaProfissionalId AND e.assistenteSocial.codigo = :codigoAssistenteSocial ")
	boolean existeNoBanco(String codigoAssistenteSocial,Long experienciaProfissionalId);
	
}
