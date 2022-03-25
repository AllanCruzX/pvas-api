package com.ikesocial.pvas.domain.repository;

import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.FotoPessoa;

@Repository
public interface FotoPessoaRepository extends CustomJpaRepository<FotoPessoa, Long>{
	
}
