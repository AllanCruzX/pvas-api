package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ikesocial.pvas.domain.filter.AssistenteSocialFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.AssistenteSocial;

public interface AssistenteSocialRepositoryQueries {
	
	Page<AssistenteSocial> listarComFiltro(AssistenteSocialFilter assistenteSocialFilter ,  Pageable pageRequest);
	
	Page<AssistenteSocial> listarComFiltroAtivos(AssistenteSocialFilter assistenteSocialFilter ,  Pageable pageRequest);
	
	Optional<AssistenteSocial> buscarPorCodigo(String codigo);

	FotoPessoa save (FotoPessoa foto);
	
	void delete(FotoPessoa foto);
}
