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

import com.ikesocial.pvas.domain.filter.AssistenteSocialFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepositoryQueries;
import com.ikesocial.pvas.infrastructure.repository.spec.AssistenteSocialSpecs;

@Repository
public class AssistenteSocialRepositoryImpl implements AssistenteSocialRepositoryQueries {

	@PersistenceContext
	private EntityManager manager;

	@Lazy
	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;

	@Override
	public Page<PessoaFisica> listarComFiltro(AssistenteSocialFilter assistenteSocialFilter , Pageable pageRequest) {
		
		return assistenteSocialRepository.findAll(
				AssistenteSocialSpecs.usandoFiltro(assistenteSocialFilter ),pageRequest);
				
	}
	
	@Override
	public Page<PessoaFisica> listarComFiltroAtivos(AssistenteSocialFilter assistenteSocialFilter, Pageable pageRequest) {
		
		return assistenteSocialRepository.findAll(
				AssistenteSocialSpecs.usandoFiltro(assistenteSocialFilter ).and(AssistenteSocialSpecs.ativos()),pageRequest);
	}


	@Override
	public Optional<PessoaFisica> buscarPorCodigo(String codigo) {
		
		var jpql = new StringBuilder();
		
		jpql.append(" SELECT DISTINCT  pf  FROM  PessoaFisica pf ");
		jpql.append(" INNER JOIN FETCH pf.contatos ");
		jpql.append(" INNER JOIN FETCH pf.documentos pfd ");
		jpql.append(" LEFT  JOIN FETCH pfd.estado ");
		jpql.append(" INNER JOIN FETCH pf.enderecos pfe ");
		jpql.append(" INNER JOIN FETCH pfe.cidade pfec ");
		jpql.append(" INNER JOIN FETCH pfec.estado");
		jpql.append(" LEFT  JOIN FETCH pf.experieciasProfissionais ");
		jpql.append(" LEFT  JOIN FETCH pf.cursos ");
		jpql.append(" LEFT  JOIN FETCH pf.idiomas ");
		jpql.append(" LEFT  JOIN FETCH pf.especializacoes ");
		jpql.append(" LEFT  JOIN FETCH pf.subEspecialidades pfs ");
		jpql.append(" LEFT  JOIN FETCH pfs.especialidade ");
		jpql.append(" WHERE  0 = 0 ");
		jpql.append(" AND  pf.codigo = :codigo ");
		
		
		TypedQuery<PessoaFisica> query = manager.createQuery(jpql.toString(), PessoaFisica.class);
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
