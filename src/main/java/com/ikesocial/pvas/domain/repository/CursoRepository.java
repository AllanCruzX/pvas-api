package com.ikesocial.pvas.domain.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Curso;

@Repository
public interface CursoRepository extends CustomJpaRepository<Curso, Long>{
	
	@Query(" SELECT c FROM Curso c  WHERE c.assistenteSocial.codigo = :codigoAssistenteSocial ")
	List<Curso> lirtarCursosAssistenteSocial(String codigoAssistenteSocial);
	
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM Curso c WHERE c.id = :cursoId AND c.assistenteSocial.codigo = :codigoAssistenteSocial ")
	boolean existeNoBanco(String codigoAssistenteSocial,Long cursoId);
	
}
