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

import com.ikesocial.pvas.domain.filter.UsuarioFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.Usuario;
import com.ikesocial.pvas.domain.repository.UsuarioRepository;
import com.ikesocial.pvas.domain.repository.UsuarioRepositoryQueries;
import com.ikesocial.pvas.infrastructure.repository.spec.UsuarioSpecs;

@Repository
public class UsuarioRepositoryImpl implements UsuarioRepositoryQueries {

	@PersistenceContext
	private EntityManager manager;

	@Lazy
	@Autowired
	private UsuarioRepository assistenteSocialRepository;

	@Override
	public Page<Usuario> listarComFiltro(UsuarioFilter usuarioFilter , Pageable pageRequest) {
		
		return assistenteSocialRepository.findAll(
				UsuarioSpecs.usandoFiltro(usuarioFilter ),pageRequest);
				
	}
	
	@Override
	public Page<Usuario> listarComFiltroAtivos(UsuarioFilter usuarioFilter, Pageable pageRequest) {
		
		return assistenteSocialRepository.findAll(
				UsuarioSpecs.usandoFiltro(usuarioFilter ).and(UsuarioSpecs.ativos()),pageRequest);
	}


	@Override
	public Optional<Usuario> buscarPorCodigo(String codigo) {
		
		var jpql = new StringBuilder();
		
		jpql.append(" SELECT DISTINCT  pf  FROM  Usuario pf ");
		jpql.append(" INNER JOIN FETCH pf.contatos ");
		jpql.append(" INNER JOIN FETCH pf.documentos pfd ");
		jpql.append(" LEFT  JOIN FETCH pfd.estado ");
		jpql.append(" INNER JOIN FETCH pf.enderecos pfe ");
		jpql.append(" INNER JOIN FETCH pfe.cidade pfec ");
		jpql.append(" INNER JOIN FETCH pfec.estado");
		jpql.append(" INNER JOIN FETCH pf.grupos pfg");
		jpql.append(" LEFT  JOIN FETCH pf.experieciasProfissionais ");
		jpql.append(" WHERE  0 = 0 ");
		jpql.append(" AND  pf.codigo = :codigo ");
		
		TypedQuery<Usuario> query = manager.createQuery(jpql.toString(), Usuario.class);
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
