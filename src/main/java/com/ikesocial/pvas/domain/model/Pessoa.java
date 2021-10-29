package com.ikesocial.pvas.domain.model;

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.domain.AbstractAggregateRoot;

import com.ikesocial.pvas.domain.event.PessoaCadastradaEvent;
import com.ikesocial.pvas.domain.model.enums.TipoContato;

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
	
	@Column(name = "senha", length = 255, nullable = false)
	private String senha;

	@Column(name = "data_cadastro", columnDefinition = "datetime", nullable = false)
	@CreationTimestamp
	private OffsetDateTime dataCadastro;
	
	@Column(name = "data_alteracao", columnDefinition = "datetime" , insertable=false)
	@UpdateTimestamp
	private OffsetDateTime dataAlteracao;
	
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
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "pessoa_grupo", 
		joinColumns = @JoinColumn(name = "pessoa_id",
				foreignKey = @ForeignKey(name = "fk_pessoa_grupo")),
			inverseJoinColumns = @JoinColumn(name = "grupo_id",
				foreignKey = @ForeignKey(name = "fk_grupo_pessoa")))
	private Set<Grupo> grupos = new HashSet<Grupo>();
	

	@PrePersist
	private void gerarCodigo() {
		setCodigo(UUID.randomUUID().toString());
		
		registerEvent(new PessoaCadastradaEvent(this));
	}
	
	public String getEmail () {
		  Optional<Contato> email = contatos.stream()
					.filter(c -> c.getTipoContato().equals(TipoContato.EMAIL))
					.findFirst();
		  
		  return email.get().getDescricao();
	}
	
	public boolean isNovo() {
	    return getId() == null;
	}
	
	public boolean removerGrupo(Grupo grupo) {
		return getGrupos().remove(grupo);
	}
	
	public boolean adicionarGrupo(Grupo grupo) {
		return getGrupos().add(grupo);
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
