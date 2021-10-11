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
import com.ikesocial.pvas.domain.model.PessoaFisica;

public class AssistenteSocialSpecs {

	public static Specification<PessoaFisica> porId(Long id) {
		return (root, query, builder) -> builder.equal(root.get("id"), id);
	}
	
	public static Specification<PessoaFisica> ativos() {
		return (root, query, builder) -> builder.equal(root.get("ativo"), true);
	}

	@SuppressWarnings("unchecked")
	public static Specification<PessoaFisica> usandoFiltro(AssistenteSocialFilter filtro ) {

		return (root, query, builder) -> {

			Fetch<Contato, PessoaFisica> joinContatoPessoaFisica = null;
			Fetch<Documento, PessoaFisica> joinDocumentoPessoFisica = null;

			if (PessoaFisica.class.equals(query.getResultType())) {

				joinContatoPessoaFisica = root.fetch("contatos");
				joinDocumentoPessoFisica = root.fetch("documentos");

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
						builder.like(builder.trim(((Path<PessoaFisica>) joinDocumentoPessoFisica).get("codigo")),
								"%" + filtro.getCpf() + "%"));
			}

			if (StringUtils.hasText(filtro.getEmail())) {
				predicates.add(builder.like(
						builder.upper(builder.trim(((Path<PessoaFisica>) joinContatoPessoaFisica).get("descricao"))),
						"%" + filtro.getEmail() + "%"));
			}

			query.distinct(true);
			return builder.and(predicates.toArray(new Predicate[0]));
		};
	}

}
