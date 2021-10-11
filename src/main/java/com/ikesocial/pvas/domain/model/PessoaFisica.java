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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "pessoa_fisica")
@PrimaryKeyJoinColumn(name = "pessoa_fisica_id", foreignKey = @ForeignKey(name = "fk_pessoa_fisica_pessoa") )
@Inheritance(strategy = InheritanceType.JOINED)
public class PessoaFisica extends Pessoa {
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
	
	@OneToMany(mappedBy ="pessoaFisica" ,  fetch = FetchType.LAZY)
	private Set<ExperienciaProfissional> experieciasProfissionais;
	
	@OneToMany(mappedBy ="pessoaFisica" ,  fetch = FetchType.LAZY)
	private Set<Curso> cursos;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoa_fisica_idioma", 
		joinColumns = @JoinColumn(name = "pessoa_fisica_id",  
			foreignKey = @ForeignKey(name = "fk_pessoa_fisica_idioma")), 
		inverseJoinColumns = @JoinColumn(name = "idioma_id", 
			foreignKey = @ForeignKey(name = "fk_idioma_pessoa_fisica")))
	private Set<Idioma> idiomas;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoa_fisica_especializacao", 
		joinColumns = @JoinColumn(name = "pessoa_fisica_id",  
			foreignKey = @ForeignKey(name = "fk_pessoa_fisica_especializacao")), 
		inverseJoinColumns = @JoinColumn(name = "especializacao_id", 
			foreignKey = @ForeignKey(name = "fk_especializacao_pessoa_fisica")))
	private Set<Especializacao> especializacoes;
	
	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoa_fisica_sub_especialidade", 
		joinColumns = @JoinColumn(name = "pessoa_fisica_id",  
			foreignKey = @ForeignKey(name = "fk_pessoa_fisica_sub_especialidade")), 
		inverseJoinColumns = @JoinColumn(name = "sub_especialidade_id", 
			foreignKey = @ForeignKey(name = "fk_sub_especialidade_pessoa_fisica")))
	private Set<SubEspecialidade> subEspecialidades;

}
