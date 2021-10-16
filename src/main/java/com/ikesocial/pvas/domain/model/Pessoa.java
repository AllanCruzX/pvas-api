package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.data.domain.AbstractAggregateRoot;

import com.ikesocial.pvas.domain.event.PessoaCadastradaEvent;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true , callSuper=false)
@Entity
@Table(name = "pessoa")
@Inheritance(strategy = InheritanceType.JOINED)
public class Pessoa extends AbstractAggregateRoot<Pessoa> implements Serializable  {
	private static final long serialVersionUID = 1L;

	@EqualsAndHashCode.Include
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "codigo", length = 35, nullable = false)
	private String codigo;

	@Column(name = "nome", length = 200, nullable = false)
	private String nome;

	@Column(name = "data_cadastro", columnDefinition = "datetime", nullable = false)
	@CreationTimestamp
	private OffsetDateTime dataCadastro;
	
	@Column(name = "data_inativacao", columnDefinition = "datetime")
	private OffsetDateTime dataIntivacao;

	@Column(name = "ativo", nullable = false)
	private Boolean ativo = Boolean.TRUE;

	@OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY,
			   cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private Set<Contato> contatos = new HashSet<Contato>();
	
	@OneToMany(mappedBy = "pessoa",fetch = FetchType.LAZY,
			   cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private Set<Documento> documentos = new HashSet<Documento>();
	
	@OneToMany(mappedBy = "pessoa",fetch = FetchType.LAZY,
			   cascade = { CascadeType.PERSIST, CascadeType.MERGE })
	private Set<Endereco> enderecos = new HashSet<Endereco>();
	

	@PrePersist
	private void gerarCodigo() {
		setCodigo(UUID.randomUUID().toString());
		
		registerEvent(new PessoaCadastradaEvent(this));
	}
	
	
	public void ativar() {
		setDataIntivacao(null);
		setAtivo(true);
	}
	
	public void inativar() {
		setDataIntivacao(OffsetDateTime.now());
		setAtivo(false);
	}
	
	public boolean isInativo() {
	    return !isAtivo();
	}

	public boolean isAtivo() {
	    return this.ativo;
	}
	
	public boolean inativacaoPermitida() {
	    return isAtivo();
	}
	
	public boolean ativacaoPermitida() {
	    return isInativo();
	}


}
