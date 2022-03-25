package com.ikesocial.pvas.infrastructure.repository;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.repository.CurriculoRepository;
import com.ikesocial.pvas.domain.repository.CurriculoRepositoryQueries;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class CurriculoRepositoryImpl implements CurriculoRepositoryQueries {

	@PersistenceContext
	private EntityManager manager;

	@Lazy
	@Autowired
	private CurriculoRepository curriculoRepository;

	@Override
	public Optional<Curriculo> buscarPorId(Long id) {
		log.info("C=CurriculoRepositoryImpl, M=buscarPorId, Buscando curriculo com o id {}", id);

		var jpql = new StringBuilder();

		jpql.append(" SELECT DISTINCT  c  FROM  Curriculo c ");
		jpql.append(" INNER JOIN FETCH c.profissoes ");
		jpql.append(" LEFT JOIN FETCH c.experieciasProfissionais ");
		jpql.append(" LEFT JOIN FETCH c.cursos ");
		jpql.append(" LEFT JOIN FETCH c.idiomas ");
		jpql.append(" LEFT JOIN FETCH c.especializacoes ");
		jpql.append(" LEFT JOIN FETCH c.subEspecialidades cs ");
		jpql.append(" LEFT JOIN FETCH cs.especialidade ");
		jpql.append(" WHERE  0 = 0 ");
		jpql.append(" AND  c.id = :id ");

		TypedQuery<Curriculo> query = manager.createQuery(jpql.toString(), Curriculo.class);
		query.setParameter("id", id);

		return Optional.of(query.getSingleResult());
	}

}
