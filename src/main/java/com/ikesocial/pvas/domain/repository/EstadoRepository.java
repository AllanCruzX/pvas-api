package com.ikesocial.pvas.domain.repository;

import java.time.OffsetDateTime;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Estado;

@Repository
public interface EstadoRepository extends CrudRepository<Estado, Long>  {
	
	Optional<Estado> findBySigla (String sigla);
	
	@Query("select max(dataAtualizacao) from Estado")
	OffsetDateTime getDataUltimaAtualizacao();

}
