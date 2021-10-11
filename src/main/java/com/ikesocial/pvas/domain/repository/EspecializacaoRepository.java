package com.ikesocial.pvas.domain.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Especializacao;

@Repository
public interface EspecializacaoRepository extends CrudRepository<Especializacao, Long>  {

}
