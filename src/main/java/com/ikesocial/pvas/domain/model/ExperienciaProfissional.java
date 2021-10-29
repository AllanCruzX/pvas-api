package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.LocalDate;
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
	
	@Column(name = "data_cadastro", columnDefinition = "datetime", nullable = false)
	@CreationTimestamp
	private OffsetDateTime dataCadastro;
	
	@Column(name = "data_alteracao", columnDefinition = "datetime", insertable=false)
	@UpdateTimestamp
	private OffsetDateTime dataAlteracao;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "assistente_social_id",
				foreignKey = @ForeignKey(name = "fk_experiecia_profissional_assistente_social"))
	private AssistenteSocial assistenteSocial;
	
	public void naoTemExperienciaProfissional() {
		setSemExperiencia(true);
		setDataInicio(null);
		setDataFim(null);
		setEmpresaAtual(null);
		setNomeEmpresa(null);
		setAvidade(null);
	}
	
	public void eEmpresaAtual() {
		setEmpresaAtual(true);
		setDataFim(null);
	}
	
}
