package com.ikesocial.pvas.infrastructure.repository.spec;

import java.util.ArrayList;

import javax.persistence.criteria.Fetch;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.util.StringUtils;

import com.ikesocial.pvas.domain.filter.AssistenteSocialFilter;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

public class AssistenteSocialSpecs {

	public static Specification<AssistenteSocial> porId(Long id) {
		return (root, query, builder) -> builder.equal(root.get("id"), id);
	}
	
	public static Specification<AssistenteSocial> ativos() {
		return (root, query, builder) -> builder.equal(root.get("ativo"), true);
	}

	@SuppressWarnings("unchecked")
	public static Specification<AssistenteSocial> usandoFiltro(AssistenteSocialFilter filtro ) {

		return (root, query, builder) -> {

			Fetch<Contato, AssistenteSocial> joinContatoAssistenteSocial = null;
			Fetch<Documento, AssistenteSocial> joinDocumentoAssistenteSocial = null;

			if (AssistenteSocial.class.equals(query.getResultType())) {

				joinContatoAssistenteSocial = root.fetch("contatos");
				joinDocumentoAssistenteSocial = root.fetch("documentos");

			}

			var predicates = new ArrayList<Predicate>();

			if (StringUtils.hasText(filtro.getCodigo())) {
				predicates.add(builder.equal(root.get("codigo"), filtro.getCodigo()));
			}

			if (StringUtils.hasText(filtro.getNome())) {
				predicates
						.add(builder.like(builder.upper(builder.trim(root.get("nome"))), "%" + filtro.getNome() + "%"));
			}

			if (StringUtils.hasText(filtro.getCpf())) {
				predicates.add(
						builder.like(builder.trim(((Path<AssistenteSocial>) joinDocumentoAssistenteSocial).get("codigo")),
								"%" + filtro.getCpf() + "%"));
			}

			if (StringUtils.hasText(filtro.getEmail())) {
				predicates.add(builder.like(
						builder.upper(builder.trim(((Path<AssistenteSocial>) joinContatoAssistenteSocial).get("descricao"))),
						"%" + filtro.getEmail() + "%"));
			}

			query.distinct(true);
			return builder.and(predicates.toArray(new Predicate[0]));
		};
	}

}
