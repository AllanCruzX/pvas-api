package com.ikesocial.pvas.domain.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
@Table(name = "foto_pessoa")
public class FotoPessoa implements Serializable {
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "nome_arquivo", length = 100)
	private String nomeArquivo;

	@Column(name = "descricao", length = 100)
	private String descricao;

	@Column(name = "content_type", length = 100)
	private String contentType;

	@Column(name = "tamanho")
	private Long tamanho;

	@OneToOne(fetch = FetchType.LAZY )
	@JoinColumn(name = "pessoa_id", foreignKey = @ForeignKey(name = "fk_foto_pessoa_pessoa"), nullable = false)
	private Pessoa pessoa;
}
