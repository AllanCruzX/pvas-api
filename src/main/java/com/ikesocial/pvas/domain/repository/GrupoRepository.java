package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.Grupo;

@Repository
public interface GrupoRepository extends CrudRepository<Grupo, Long>  {
	
	@Query(" SELECT p FROM Profissional p INNER JOIN FETCH p.grupos pg INNER JOIN FETCH pg.permissoes WHERE p.codigo = :codigoDoProfissional")
	Optional<Profissional> lirtarGruposDaAssistenteSocial(String codigoDoProfissional);
	
}
