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

import com.ikesocial.pvas.domain.enums.TipoEndereco;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "endereco")
public class Endereco implements Serializable {
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "cep", length = 100, nullable = false)
	private String cep;
	
	@Column(name = "logradouro", length = 200, nullable = false)
	private String logradouro;
	
	@Column(name = "bairro", length = 200, nullable = false)
	private String bairro;
	
	@Column(name = "numero", length = 50, nullable = false)
	private String numero;
	
	@Column(name = "complemento", length = 200)
	private String complemento;
	
	@Column(name = "tipo_endereco", length = 50 ,nullable = false)
	@Enumerated(EnumType.STRING)
	private TipoEndereco tipoEndereco;
	
	@Column(name = "principal", nullable = false)
	private Boolean principal;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cidade_id",
				foreignKey = @ForeignKey(name = "fk_endereco_cidade"),
				nullable = false)
	private Cidade cidade;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pessoa_id",
				foreignKey = @ForeignKey(name = "fk_endereco_pessoa"),
				nullable = false)
	private Pessoa pessoa;
	
	public boolean eUmEnderecoResidencial () {
		return this.getTipoEndereco().equals(TipoEndereco.RESIDENCIAL);
	}

}
