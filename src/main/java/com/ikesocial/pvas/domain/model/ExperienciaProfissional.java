package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.LocalDate;

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
@Table(name = "experiecia_profissional")
public class ExperienciaProfissional  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "nome_empresa", length = 100)
	private String nomeEmpresa;
	
	@Column(name = "atividade", length = 65535 , columnDefinition="Text")
	private String avidade;
	
	@Column(name ="data_inicio", columnDefinition = "date")
	private LocalDate dataInicio;
	
	@Column(name ="data_fim", columnDefinition = "date")
	private LocalDate dataFim;
	
	@Column(name = "empresa_atual" )
	private Boolean empresaAtual;
	
	@Column(name = "sem_experiencia" )
	private Boolean semExperiencia;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pessoa_fisica_id",
				foreignKey = @ForeignKey(name = "fk_experiecia_profissional_pessoa_fisica"),
				nullable = false)
	private PessoaFisica pessoaFisica;
	
}
