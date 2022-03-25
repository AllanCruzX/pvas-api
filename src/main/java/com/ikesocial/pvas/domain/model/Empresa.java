package com.ikesocial.pvas.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "empresa")
@PrimaryKeyJoinColumn(name = "empresa_id", foreignKey = @ForeignKey(name = "fk_empresa_pessoa") )
@Inheritance(strategy = InheritanceType.JOINED)
public class Empresa extends Pessoa {
	private static final long serialVersionUID = 1L;

	@Column(name = "visao" , length = 200)
	private String visao;
	
	@Column(name = "valor" , length = 200)
	private String valor;

}
