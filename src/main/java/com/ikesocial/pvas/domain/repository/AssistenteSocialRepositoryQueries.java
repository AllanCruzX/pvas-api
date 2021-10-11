package com.ikesocial.pvas.domain.repository;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.ikesocial.pvas.domain.filter.AssistenteSocialFilter;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.model.PessoaFisica;

public interface AssistenteSocialRepositoryQueries {
	
	Page<PessoaFisica> listarComFiltro(AssistenteSocialFilter assistenteSocialFilter ,  Pageable pageRequest);
	
	Page<PessoaFisica> listarComFiltroAtivos(AssistenteSocialFilter assistenteSocialFilter ,  Pageable pageRequest);
	
	Optional<PessoaFisica> buscarPorCodigo(String codigo);

	FotoPessoa save (FotoPessoa foto);
	
	void delete(FotoPessoa foto);
}
