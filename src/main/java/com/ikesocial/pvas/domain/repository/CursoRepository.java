package com.ikesocial.pvas.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Curso;

@Repository
public interface CursoRepository extends CustomJpaRepository<Curso, Long>{
	
	@Query(" SELECT c FROM Curso c  WHERE c.pessoaFisica.codigo = :codigoPessoaFisica ")
	List<Curso> lirtarCursosDaPessoaFisica(String codigoPessoaFisica);
	
}
