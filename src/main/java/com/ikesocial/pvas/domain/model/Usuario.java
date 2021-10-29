package com.ikesocial.pvas.domain.model;

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
@Table(name = "usuario")
@PrimaryKeyJoinColumn(name = "usuario_id", foreignKey = @ForeignKey(name = "fk_usuario_pessoa") )
@Inheritance(strategy = InheritanceType.JOINED)
public class Usuario extends Pessoa {
	private static final long serialVersionUID = 1L;

}
