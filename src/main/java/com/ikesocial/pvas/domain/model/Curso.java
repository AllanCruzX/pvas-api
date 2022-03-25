package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.OffsetDateTime;

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

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
	
	@EqualsAndHashCode.Include
	@Column(name = "nome", length = 100, nullable = false)
	private String nome;
	
	@Column(name = "chaga_horaria", nullable = false)
	private Long chagaHoraria;
	
	
	@Column(name = "data_cadastro", columnDefinition = "datetime", nullable = false)
	@CreationTimestamp
	private OffsetDateTime dataCadastro;
	
	@Column(name = "data_alteracao", columnDefinition = "datetime" , insertable=false)
	@UpdateTimestamp
	private OffsetDateTime dataAlteracao;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "curriculo_id",
				foreignKey = @ForeignKey(name = "fk_curso_curriculo"))
	private Curriculo curriculo;
	
	public boolean isNovo() {
	    return getId() == null;
	}

}
