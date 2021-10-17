package com.ikesocial.pvas.domain.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "grupo")
public class Grupo {

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "nome", length = 100, nullable = false)
	private String nome;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "grupo_permissao", 
			joinColumns = @JoinColumn(name = "grupo_id",
					foreignKey = @ForeignKey(name = "fk_grupo_permissao")), 
			inverseJoinColumns = @JoinColumn(name = "permissao_id",
					foreignKey = @ForeignKey(name = "fk_permissao_grupo")))
	private Set<Permissao> permissoes = new HashSet<Permissao>();
	
	public boolean removerPermissao(Permissao permissao) {
		return getPermissoes().remove(permissao);
	}
	
	public boolean adicionarPermissao(Permissao permissao) {
		return getPermissoes().add(permissao);
	}

}
