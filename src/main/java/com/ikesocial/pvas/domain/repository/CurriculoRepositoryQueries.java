package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import com.ikesocial.pvas.domain.model.Curriculo;

public interface CurriculoRepositoryQueries {
	
	Optional<Curriculo> buscarPorId(Long id);

}
