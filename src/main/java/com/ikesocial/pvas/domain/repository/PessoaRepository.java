package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Pessoa;

@Repository
public interface PessoaRepository extends JpaRepository<Pessoa, Long> {
	
	@Query(" SELECT p FROM Pessoa p INNER JOIN FETCH p.contatos pc LEFT JOIN FETCH p.grupos pg LEFT JOIN FETCH pg.permissoes WHERE pc.descricao = :email ")
	Optional<Pessoa> buscarPessoaPorEmail(String email);
	
}
