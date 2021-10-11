package com.ikesocial.pvas.infrastructure.service.query;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;

import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.filter.AssistenteSocialEstatisticaFilter;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.model.dto.AssistenteSocialEstatistica;
import com.ikesocial.pvas.domain.service.AssistenteSocialQueryService;

@Repository
public class AssistenteSocialQueryServiceImpl implements AssistenteSocialQueryService {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public List<AssistenteSocialEstatistica> consultarAssistenteSocialEstatisticas(
			AssistenteSocialEstatisticaFilter filtro , String timeOffset) {

		var builder = manager.getCriteriaBuilder();
		var query = builder.createQuery(AssistenteSocialEstatistica.class);
		var root = query.from(PessoaFisica.class);
		var predicates = new ArrayList<Predicate>();
		
//		var functionConvertTzDataCadastro = builder.function(
//				"convert_tz", Date.class, root.get("dataCadastro"),
//				builder.literal("+00:00"), builder.literal(timeOffset));
//		
//		var functionConvertTzDataInativacao = builder.function(
//				"convert_tz", Date.class, root.get("dataIntivacao"),
//				builder.literal("+00:00"), builder.literal(timeOffset));

		var selection = builder.construct(AssistenteSocialEstatistica.class, 
				builder.count(root.get("id")),
				root.get("ativo"));
		
		if(filtro.getAtivo() != null   ) {
			if(filtro.getAtivo() == 0L ) {
				predicates.add(builder.equal(root.get("ativo"), true));
			}else {
				predicates.add(builder.equal(root.get("ativo"), false));
			}
			
		}
			
			if (filtro.getDataCadastro() != null) {
				predicates.add(builder.greaterThanOrEqualTo(root.get("dataCadastro"), 
						filtro.getDataCadastro()));
			}
			
			if (filtro.getDataIntivacao() != null) {
				predicates.add(builder.greaterThanOrEqualTo(root.get("dataIntivacao"), 
						filtro.getDataIntivacao()));
			}
			
			if(filtro.getEstadoId() != null) {
				
				Join<Endereco, PessoaFisica> joinEstadoPessoaFisica = root.join("enderecos").join("cidade").join("estado");
				predicates.add(builder.equal((joinEstadoPessoaFisica).get("id"), filtro.getEstadoId()));
				
			}
			
			query.select(selection);
			query.where(predicates.toArray(new Predicate[0]));
			query.groupBy(root.get("ativo"));
		
			return manager.createQuery(query).getResultList();
	}

}
