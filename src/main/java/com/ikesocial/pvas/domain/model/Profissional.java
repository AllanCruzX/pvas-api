package com.ikesocial.pvas.domain.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.ikesocial.pvas.domain.model.enums.EstadoCivil;
import com.ikesocial.pvas.domain.model.enums.Sexo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "profissional")
@PrimaryKeyJoinColumn(name = "profissional_id", foreignKey = @ForeignKey(name = "fk_profissional_pessoa") )
@Inheritance(strategy = InheritanceType.JOINED)
public class Profissional extends Pessoa {
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
	
	@OneToOne(fetch = FetchType.LAZY ,orphanRemoval = true)
	@JoinColumn(name = "curriculo_id", foreignKey = @ForeignKey(name = "fk_profissional_curriculo"))
	private Curriculo curriculo;

}
