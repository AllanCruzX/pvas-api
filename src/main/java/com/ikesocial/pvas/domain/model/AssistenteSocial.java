package com.ikesocial.pvas.domain.model;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "assistente_social")
@PrimaryKeyJoinColumn(name = "assistente_social_id", foreignKey = @ForeignKey(name = "fk_assistente_social_pessoa") )
@Inheritance(strategy = InheritanceType.JOINED)
public class AssistenteSocial extends Pessoa {
	private static final long serialVersionUID = 1L;

	@Column(name = "nome_mae" , length = 100)
	private String nomeMae;

	@Column(name = "nome_pai" , length = 100)
	private String nomePai;
	
	@Column(name ="data_nascimento", columnDefinition = "date", nullable = false)
	private LocalDate dataNascimento;
	
	@Column(name ="pne", nullable = false)
	private Boolean pne;
	
	@Column(name = "sexo", length = 20 ,nullable = false)
	@Enumerated(EnumType.STRING)
	private Sexo sexo;
	
	@Column(name = "estado_civil", length = 50 ,nullable = false)
	@Enumerated(EnumType.STRING)
	private EstadoCivil estadoCivil;
	
	@OneToMany(mappedBy ="assistenteSocial" ,  fetch = FetchType.LAZY)
	private Set<ExperienciaProfissional> experieciasProfissionais;
	
	@OneToMany(mappedBy ="assistenteSocial" ,  fetch = FetchType.LAZY)
	private Set<Curso> cursos;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "assistente_social_idioma", 
		joinColumns = @JoinColumn(name = "assistente_social_id",  
			foreignKey = @ForeignKey(name = "fk_assistente_social_idioma")), 
		inverseJoinColumns = @JoinColumn(name = "idioma_id", 
			foreignKey = @ForeignKey(name = "fk_idioma_assistente_social")))
	private Set<Idioma> idiomas;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "assistente_social_especializacao", 
		joinColumns = @JoinColumn(name = "assistente_social_id",  
			foreignKey = @ForeignKey(name = "fk_assistente_social_especializacao")), 
		inverseJoinColumns = @JoinColumn(name = "especializacao_id", 
			foreignKey = @ForeignKey(name = "fk_especializacao_assistente_social")))
	private Set<Especializacao> especializacoes;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "assistente_social_sub_especialidade", 
		joinColumns = @JoinColumn(name = "assistente_social_id",  
			foreignKey = @ForeignKey(name = "fk_assistente_social_sub_especialidade")), 
		inverseJoinColumns = @JoinColumn(name = "sub_especialidade_id", 
			foreignKey = @ForeignKey(name = "fk_sub_especialidade_assistente_social")))
	private Set<SubEspecialidade> subEspecialidades;

}
