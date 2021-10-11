package com.ikesocial.pvas.infrastructure.repository;

import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import com.ikesocial.pvas.domain.repository.CustomJpaRepository;

public class CustomJpaRepositoryImpl<T, ID> extends SimpleJpaRepository<T, ID> implements CustomJpaRepository<T, ID> {

	private EntityManager manager;

	public CustomJpaRepositoryImpl(JpaEntityInformation<T, ?> entityInformation, EntityManager entityManager) {
		super(entityInformation, entityManager);

		this.manager = entityManager;
	}

	@Override
	public Optional<T> buscarPrimeiro() {
		var jpql = "from " + getDomainClass().getName();

		T entity = manager.createQuery(jpql, getDomainClass()).setMaxResults(1).getSingleResult();

		return Optional.ofNullable(entity);
	}

	@Override
	public Optional<T> buscarUltimo() {
		var jpql = "from " + getDomainClass().getName() + " ORDER BY id DESC";

		T entity = manager.createQuery(jpql, getDomainClass()).setMaxResults(1).getSingleResult();

		return Optional.ofNullable(entity);
	}

	@Override
	public void detach(T entity) {
		manager.detach(entity);
	}

}
