package com.ikesocial.pvas.domain.service;

import java.io.InputStream;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.FotoProfissionalNaoEncontradoException;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.repository.FotoPessoaRepository;
import com.ikesocial.pvas.domain.repository.ProfissionalRepository;
import com.ikesocial.pvas.domain.service.FotoStorageService.NovaFoto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CatalogoFotoProfissional {

	@Autowired
	private ProfissionalRepository profissionalRepository;

	@Autowired
	private FotoStorageService fotoStorage;
	
	@Autowired
	private FotoPessoaRepository fotoPessoaRepository;

	@Transactional
	public FotoPessoa salvar(FotoPessoa foto, InputStream dadosArquivo) {
		log.info("C=CatalogoFotoProfissional,M=salvar, Salvando foto");
		
		String nomeNovoArquivo = fotoStorage.gerarNomeArquivo(foto.getNomeArquivo());
		String nomeArquivoExistente = null;

		Optional<FotoPessoa> fotoExistente = profissionalRepository.buscarFotoPorId(foto.getPessoa().getId());
		
		if (fotoExistente.isPresent()) {
			nomeArquivoExistente = fotoExistente.get().getNomeArquivo();
			profissionalRepository.delete(fotoExistente.get());
		}

		foto.setNomeArquivo(nomeNovoArquivo);
		foto = fotoPessoaRepository.save(foto);
		log.info("Foto salva no banco");

		NovaFoto novaFoto = NovaFoto.builder()
				.nomeAquivo(foto.getNomeArquivo())
				.contentType(foto.getContentType())
				.inputStream(dadosArquivo)
				.build();

		fotoStorage.substituir(nomeArquivoExistente, novaFoto);

		return foto;
	}
	
	@Transactional
	public void excluir(String codigo) {
	    FotoPessoa foto = buscarOuFalhar(codigo);
	    
	    profissionalRepository.delete(foto);
	    profissionalRepository.flush();

	    fotoStorage.remover(foto.getNomeArquivo());
	}

	public FotoPessoa buscarOuFalhar(String codigo) {
		return profissionalRepository.buscarFotoPorCodigo(codigo)
				.orElseThrow(() -> new FotoProfissionalNaoEncontradoException(codigo));
	}

}
