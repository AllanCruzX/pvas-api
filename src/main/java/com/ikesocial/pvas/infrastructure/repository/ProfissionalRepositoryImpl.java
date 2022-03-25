package com.ikesocial.pvas.infrastructure.repository;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.filter.ProfissionalFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;
import com.ikesocial.pvas.domain.repository.ProfissionalRepositoryQueries;
import com.ikesocial.pvas.infrastructure.repository.spec.ProfissionalSpecs;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class ProfissionalRepositoryImpl implements ProfissionalRepositoryQueries {

	@PersistenceContext
	private EntityManager manager;

	@Lazy
	@Autowired
	private ProfissionalRepository profissionalRepository;

	@Override
	public Page<Profissional> listarComFiltro(ProfissionalFilter profissionalFilter , Pageable pageRequest) {
		log.info("C=ProfissionalRepositoryImpl, M=listarComFiltro, Buscando profissionais");
		
		return profissionalRepository.findAll(
				ProfissionalSpecs.usandoFiltro(profissionalFilter ),pageRequest);
				
	}
	
	@Override
	public Page<Profissional> listarComFiltroAtivos(ProfissionalFilter profissionalFilter , Pageable pageRequest) {
		log.info("C=ProfissionalRepositoryImpl, M=listarComFiltroAtivos, Buscando profissionais");
		
		return profissionalRepository.findAll(
				ProfissionalSpecs.usandoFiltro(profissionalFilter ).and(ProfissionalSpecs.ativos()),pageRequest);
	}


	@Override
	public Optional<Profissional> buscarPorCodigo(String codigo) {
		log.info("C=ProfissionalRepositoryImpl, M=buscarPorCodigo, Buscando profissional com o codigo {}",  codigo);
		
		var jpql = new StringBuilder();
		
		jpql.append(" SELECT DISTINCT  pf  FROM  Profissional pf ");
		jpql.append(" INNER JOIN FETCH pf.contatos ");
		jpql.append(" INNER JOIN FETCH pf.documentos pfd ");
		jpql.append(" LEFT  JOIN FETCH pfd.estado ");
		jpql.append(" INNER JOIN FETCH pf.enderecos pfe ");
		jpql.append(" INNER JOIN FETCH pfe.cidade pfec ");
		jpql.append(" INNER JOIN FETCH pfec.estado");
		jpql.append(" INNER JOIN FETCH pf.grupos pfg");
		
		jpql.append(" LEFT JOIN FETCH pf.curriculo pfc");
		jpql.append(" LEFT JOIN FETCH pfc.profissoes ");
		jpql.append(" LEFT JOIN FETCH pfc.experieciasProfissionais ");
		jpql.append(" LEFT JOIN FETCH pfc.cursos ");
		jpql.append(" LEFT JOIN FETCH pfc.idiomas ");
		jpql.append(" LEFT JOIN FETCH pfc.especializacoes ");
		jpql.append(" LEFT JOIN FETCH pfc.subEspecialidades pfcs ");
		jpql.append(" LEFT JOIN FETCH pfcs.especialidade ");
		
		jpql.append(" WHERE  0 = 0 ");
		jpql.append(" AND  pf.codigo = :codigo ");
		
		
		TypedQuery<Profissional> query = manager.createQuery(jpql.toString(), Profissional.class);
		query.setParameter("codigo", codigo);
		 
		return Optional.of(query.getSingleResult());
	}
	
	@Transactional
	@Override
	public FotoPessoa save(FotoPessoa foto) {
		return manager.merge(foto);
	}

	@Override
	public void delete(FotoPessoa foto) {
		manager.remove(foto);
		
	}


}
