package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "curriculo")
public class Curriculo implements Serializable{
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@OneToOne(fetch = FetchType.LAZY )
	@JoinColumn(name = "profissional_id", foreignKey = @ForeignKey(name = "fk_curriculo_profissional"), nullable = false)
	private Profissional profissional;
	
	@OneToMany(mappedBy = "curriculo", fetch = FetchType.LAZY ,  cascade = { CascadeType.ALL },orphanRemoval = true )
	private Set<Curso> cursos;

	@OneToMany(mappedBy = "curriculo" ,fetch = FetchType.LAZY, cascade = { CascadeType.ALL },orphanRemoval = true)
	private Set<ExperienciaProfissional> experieciasProfissionais;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "curriculo_profissao", 
		joinColumns = @JoinColumn(name = "curriculo_id",  
			foreignKey = @ForeignKey(name = "fk_curriculo_profissao")), 
		inverseJoinColumns = @JoinColumn(name = "profissao_id", 
			foreignKey = @ForeignKey(name = "fk_profissao_curriculo")))
	private Set<Profissao> profissoes;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "curriculo_idioma", 
		joinColumns = @JoinColumn(name = "curriculo_id",  
			foreignKey = @ForeignKey(name = "fk_curriculo_idioma")), 
		inverseJoinColumns = @JoinColumn(name = "idioma_id", 
			foreignKey = @ForeignKey(name = "fk_idioma_curriculo")))
	private Set<Idioma> idiomas;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "curriculo_especializacao", 
		joinColumns = @JoinColumn(name = "curriculo_id",  
			foreignKey = @ForeignKey(name = "fk_curriculo_especializacao")), 
		inverseJoinColumns = @JoinColumn(name = "especializacao_id", 
			foreignKey = @ForeignKey(name = "fk_especializacao_curriculo")))
	private Set<Especializacao> especializacoes;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "curriculo_sub_especialidade", 
		joinColumns = @JoinColumn(name = "curriculo_id",  
			foreignKey = @ForeignKey(name = "fk_curriculo_sub_especialidade")), 
		inverseJoinColumns = @JoinColumn(name = "sub_especialidade_id", 
			foreignKey = @ForeignKey(name = "fk_sub_especialidade_curriculo")))
	private Set<SubEspecialidade> subEspecialidades;
	
	public boolean isNovo() {
	    return getId() == null;
	}
	
	public boolean temExperienciaProfissional() {
	    return this.getExperieciasProfissionais() != null
				&& !this.getExperieciasProfissionais().isEmpty();
	}
	
	public boolean temCurso() {
		return this.getCursos() != null
				&& !this.getCursos().isEmpty();
	}
	
	public boolean temEspecializacao() {
		return this.getEspecializacoes() != null 
				&& !this.getEspecializacoes().isEmpty();
	}
	
	public boolean temIdioma() {
		return this.getIdiomas() != null 
				&& !this.getIdiomas().isEmpty();
	}
	
	public boolean temSubEspecialidade() {
		return this.getSubEspecialidades() != null 
				&& !this.getSubEspecialidades().isEmpty();
	}
	
	public boolean temProfissao() {
		return this.getProfissoes() != null 
				&& !this.getProfissoes().isEmpty();
	}
	
}
