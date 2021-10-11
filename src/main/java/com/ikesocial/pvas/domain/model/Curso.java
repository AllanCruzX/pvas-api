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
@Table(name = "curso")
public class Curso  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "nome", length = 100, nullable = false)
	private String nome;
	
	@Column(name = "chaga_horaria", length = 100, nullable = false)
	private String chagaHoraria;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pessoa_fisica_id",
				foreignKey = @ForeignKey(name = "fk_curso_pessoa_fisica"),
				nullable = false)
	private PessoaFisica pessoaFisica;

}
