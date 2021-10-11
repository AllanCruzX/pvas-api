package com.ikesocial.pvas.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Cidade;

@Repository
public interface CidadeRepository extends CrudRepository<Cidade, Long>  {
	
	Optional<Cidade> findByNome(String nome);

	@Query("SELECT c FROM Cidade c INNER JOIN FETCH  c.estado ce WHERE ce.id = :estadoId ORDER BY c.nome")
	List<Cidade> listarCidadesPorEstado(Long estadoId);
}
