package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ikesocial.pvas.domain.filter.ProfissionalFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.Profissional;

public interface ProfissionalRepositoryQueries {
	
	Page<Profissional> listarComFiltro(ProfissionalFilter profissionalFilter ,  Pageable pageRequest);
	
	Page<Profissional> listarComFiltroAtivos(ProfissionalFilter profissionalFilter ,  Pageable pageRequest);
	
	Optional<Profissional> buscarPorCodigo(String codigo);

	FotoPessoa save (FotoPessoa foto);
	
	void delete(FotoPessoa foto);
}
