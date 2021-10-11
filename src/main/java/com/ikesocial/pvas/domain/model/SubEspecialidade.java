package com.ikesocial.pvas.domain.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "sub_especialidade")
public class SubEspecialidade implements Serializable {
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "nome", length = 50, nullable = false)
	private String nome;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "especialidade_id", 
				foreignKey = @ForeignKey(name = "fk_sub_especialidade_especialidade"),
				nullable = false)
	private Especialidade especialidade;

}
