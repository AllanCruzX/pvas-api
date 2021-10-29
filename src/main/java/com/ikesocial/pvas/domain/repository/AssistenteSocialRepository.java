package com.ikesocial.pvas.domain.repository;

import java.util.Optional;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

@Repository
public interface AssistenteSocialRepository extends CustomJpaRepository<AssistenteSocial, Long>, AssistenteSocialRepositoryQueries,
		JpaSpecificationExecutor<AssistenteSocial> {
	
	@Query(" SELECT a FROM AssistenteSocial a WHERE a.codigo = :codigo ")
	Optional<AssistenteSocial> findByCodigo(String codigo);
	
	@Query(" SELECT d FROM Documento d WHERE d.codigo = :codigo AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CPF ")
	Optional<Documento> buscarCPF(String codigo);

	@Query(" SELECT d FROM Documento d  WHERE d.codigo = :codigo AND d.pessoa.id = :assistenteSocialId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CPF ")
	Optional<Documento> buscarCPF(Long assistenteSocialId,  String codigo);

	@Query(" SELECT d FROM Documento d INNER JOIN FETCH d.estado INNER JOIN FETCH d.pessoa dp  WHERE d.codigo = :codigo AND dp.id = :assistenteSocialId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CARTEIRA_PROFISSIONAL ")
	Optional<Documento> buscarCress( Long assistenteSocialId,  String codigo);

	@Query(" SELECT d FROM Documento d INNER JOIN FETCH d.estado de WHERE d.codigo = :codigo AND de.id = :estadoId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CARTEIRA_PROFISSIONAL ")
	Optional<Documento> buscarCressRegiao( Long estadoId,  String codigo);
	
	@Query(" SELECT d FROM Documento d WHERE d.pessoa.codigo = :codigoAssistenteSocial ")
	Set<Documento> listarDocumentosAssistenteSocial(String codigoAssistenteSocial);
	
	@Query(" SELECT c FROM Contato c WHERE c.descricao = :email ")
	Optional<Contato> buscarEmail(String email);
	
	@Query(" SELECT c FROM Contato c WHERE c.pessoa.codigo = :codigoAssistenteSocial ")
	Set<Contato> listarContatosAssistenteSocial(String codigoAssistenteSocial);
	
	@Query(" SELECT f FROM FotoPessoa f INNER JOIN f.pessoa fp  WHERE fp.id = :id")
	Optional<FotoPessoa> buscarFotoPorId (Long id);
	
	@Query(" SELECT f FROM FotoPessoa f INNER JOIN f.pessoa fp  WHERE fp.codigo = :codigo")
	Optional<FotoPessoa> buscarFotoPorCodigo (String codigo);
	
	@Query(" SELECT e FROM Endereco e INNER JOIN FETCH e.cidade ec INNER JOIN ec.estado WHERE e.cep = :cep")
	Optional<Endereco> buscarEnderecoPorCep (String cep);
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM AssistenteSocial a WHERE a.codigo = :codigoAssistenteSocial ")
	boolean existeAssitenteSocialNoBanco(String codigoAssistenteSocial);
	

}
