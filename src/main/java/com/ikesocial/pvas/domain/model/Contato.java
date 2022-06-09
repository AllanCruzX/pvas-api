package com.ikesocial.pvas.domain.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ikesocial.pvas.domain.enums.TipoContato;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "contato")
public class Contato implements Serializable {
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@EqualsAndHashCode.Include
	@Column(name = "descricao", length = 200, nullable = false)
	private String descricao;
	
	@Column(name = "tipo_contato", length = 50 ,nullable = false)
	@Enumerated(EnumType.STRING)
	private TipoContato tipoContato;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pessoa_id",
				foreignKey = @ForeignKey(name = "fk_contato_pessoa"),
				nullable = false)
	private Pessoa pessoa;
	
	public boolean eUmEmail () {
		return this.getTipoContato().equals(TipoContato.EMAIL);
	}
	
	public boolean eUmCelular () {
		return this.getTipoContato().equals(TipoContato.CELULAR);
	}
	
	public boolean eUmFacebook () {
		return this.getTipoContato().equals(TipoContato.FACEBOOK);
	}
	
	public boolean eUmIstagran () {
		return this.getTipoContato().equals(TipoContato.INSTAGRAN);
	}
	
	public boolean eUmLinkedin () {
		return this.getTipoContato().equals(TipoContato.LINKEDIN);
	}
	
	public boolean eUmSite () {
		return this.getTipoContato().equals(TipoContato.SITE);
	}
	
	public boolean eUmYoutube () {
		return this.getTipoContato().equals(TipoContato.YOUTUBE);
	}

}
