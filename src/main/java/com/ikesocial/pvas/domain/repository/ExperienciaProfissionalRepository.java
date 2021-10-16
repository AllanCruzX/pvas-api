package com.ikesocial.pvas.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.ExperienciaProfissional;

@Repository
public interface ExperienciaProfissionalRepository extends CustomJpaRepository<ExperienciaProfissional, Long>{
	
	@Query(" SELECT e FROM ExperienciaProfissional e  WHERE e.assistenteSocial.codigo = :codigoAssistenteSocial ")
	List<ExperienciaProfissional> lirtarExperienciaProfissionalDaAssistenteSocial(String codigoAssistenteSocial);
	
}
