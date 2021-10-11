package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.LocalDate;

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


import com.ikesocial.pvas.domain.model.enums.TipoDocumento;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "documento")
public class Documento implements Serializable {
	private static final long serialVersionUID = 1L;
 
	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@EqualsAndHashCode.Include
	@Column(name = "codigo", length = 100 , nullable = false)
	private String codigo;
	
	@Column(name = "orgao_expedidor", length = 100)
	private String orgaoExpedidor;
	
	@Column(name = "serie_categoria_zona", length = 100)
	private String serieCategoriaZona;
	
	@Column(name = "sessao", length = 50)
	private String sessao;
	
	@Column(name ="data_emissao", columnDefinition = "date")
	private LocalDate dataEmissao;
	
	@Column(name = "tipo_documento", length = 50 , nullable = false)
	@Enumerated(EnumType.STRING)
	private TipoDocumento tipoDocumento;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "estado_id",
    			foreignKey = @ForeignKey(name = "fk_documento_estado"),
    			nullable = true)
	private Estado estado;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pessoa_id",
				foreignKey = @ForeignKey(name = "fk_documento_pessoa"),
				nullable = false)
	private Pessoa pessoa;
	
	public boolean eUmCpf () {
		return this.getTipoDocumento().equals(TipoDocumento.CPF);
	}
	
	public boolean eUmCress() {
		return this.getTipoDocumento().equals(TipoDocumento.CARTEIRA_PROFISSIONAL);
	}

}
