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
import com.ikesocial.pvas.domain.model.Profissional;

@Repository
public interface ProfissionalRepository extends CustomJpaRepository<Profissional, Long>, ProfissionalRepositoryQueries,
		JpaSpecificationExecutor<Profissional> {
	
	@Query(" SELECT p FROM Profissional p WHERE p.codigo = :codigo ")
	Optional<Profissional> findByCodigo(String codigo);
	
	@Query(" SELECT d FROM Documento d WHERE d.codigo = :codigo AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CPF ")
	Optional<Documento> buscarCPF(String codigo);

	@Query(" SELECT d FROM Documento d  WHERE d.codigo = :codigo AND d.pessoa.id = :profissionalId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CPF ")
	Optional<Documento> buscarCPF(Long profissionalId,  String codigo);

	@Query(" SELECT d FROM Documento d INNER JOIN FETCH d.estado INNER JOIN FETCH d.pessoa dp  WHERE d.codigo = :codigo AND dp.id = :profissionalId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CARTEIRA_PROFISSIONAL ")
	Optional<Documento> buscarCress( Long profissionalId,  String codigo);

	@Query(" SELECT d FROM Documento d INNER JOIN FETCH d.estado de WHERE d.codigo = :codigo AND de.id = :estadoId AND d.tipoDocumento = com.ikesocial.pvas.domain.model.enums.TipoDocumento.CARTEIRA_PROFISSIONAL ")
	Optional<Documento> buscarCressRegiao( Long estadoId,  String codigo);
	
	@Query(" SELECT d FROM Documento d WHERE d.pessoa.codigo = :codigoDoProfissioanl ")
	Set<Documento> listarDocumentosDoProfissional(String codigoDoProfissioanl);
	
	@Query(" SELECT c FROM Contato c WHERE c.descricao = :email ")
	Optional<Contato> buscarEmail(String email);
	
	@Query(" SELECT c FROM Contato c WHERE c.pessoa.codigo = :codigoDoProfissioanl ")
	Set<Contato> listarContatosDoProfissional(String codigoDoProfissioanl);
	
	@Query(" SELECT f FROM FotoPessoa f INNER JOIN f.pessoa fp  WHERE fp.id = :id")
	Optional<FotoPessoa> buscarFotoPorId (Long id);
	
	@Query(" SELECT f FROM FotoPessoa f INNER JOIN f.pessoa fp  WHERE fp.codigo = :codigo")
	Optional<FotoPessoa> buscarFotoPorCodigo (String codigo);
	
	@Query(" SELECT e FROM Endereco e INNER JOIN FETCH e.cidade ec INNER JOIN ec.estado WHERE e.cep = :cep")
	Optional<Endereco> buscarEnderecoPorCep (String cep);
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM Profissional p WHERE p.codigo = :codigoDoProfissioanl ")
	boolean existeProfissionalNoBanco(String codigoDoProfissioanl);
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM Curriculo c WHERE c.id = :curriculoId AND c.profissional.codigo = :codigoDoProfissioanl ")
	boolean existeProfissionalNoBancoParaOCurriculo(Long curriculoId,String codigoDoProfissioanl);

}
