package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.OffsetDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "estado")
public class Estado implements Serializable {
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "nome", length = 50, nullable = false)
	private String nome;
	
	@Column(name = "sigla", length = 10, nullable = false)	
	private String sigla;
	
	@UpdateTimestamp
	@Column(name = "data_atualizacao", nullable = false)
	private OffsetDateTime dataAtualizacao;

}
