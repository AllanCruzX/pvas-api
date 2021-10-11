package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.PessoaFisica;

@Repository
public interface AssistenteSocialRepository extends CustomJpaRepository<PessoaFisica, Long>, AssistenteSocialRepositoryQueries,
		JpaSpecificationExecutor<PessoaFisica> {
	
	@Query(" SELECT p FROM PessoaFisica p WHERE p.codigo = :codigo ")
	Optional<PessoaFisica> findByCodigo(String codigo);
	
	@Query(" SELECT d FROM Documento d WHERE d.codigo = :codigo AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CPF ")
	Optional<Documento> buscarCPF(String codigo);

	@Query(" SELECT d FROM Documento d  WHERE d.codigo = :codigo AND d.pessoa.id = :pessoaFisicaId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CPF ")
	Optional<Documento> buscarCPF(Long pessoaFisicaId,  String codigo);

	@Query(" SELECT d FROM Documento d INNER JOIN FETCH d.estado INNER JOIN FETCH d.pessoa dp  WHERE d.codigo = :codigo AND dp.id = :pessoaFisicaId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CARTEIRA_PROFISSIONAL ")
	Optional<Documento> buscarCress( Long pessoaFisicaId,  String codigo);

	@Query(" SELECT d FROM Documento d INNER JOIN FETCH d.estado de WHERE d.codigo = :codigo AND de.id = :estadoId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CARTEIRA_PROFISSIONAL ")
	Optional<Documento> buscarCressRegiao( Long estadoId,  String codigo);
	
	@Query(" SELECT c FROM Contato c WHERE c.descricao = :email")
	Optional<Contato> buscarEmail(String email);
	
	@Query(" SELECT f FROM FotoPessoa f INNER JOIN f.pessoa fp  WHERE fp.id = :id")
	Optional<FotoPessoa> buscarFotoPorId (Long id);
	
	@Query(" SELECT f FROM FotoPessoa f INNER JOIN f.pessoa fp  WHERE fp.codigo = :codigo")
	Optional<FotoPessoa> buscarFotoPorCodigo (String codigo);
	
	@Query(" SELECT e FROM Endereco e INNER JOIN FETCH e.cidade ec INNER JOIN ec.estado WHERE e.cep = :cep")
	Optional<Endereco> buscarEnderecoPorCep (String cep);

}
