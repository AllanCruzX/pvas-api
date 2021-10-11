package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.FotoAssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.model.FotoPessoa;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;
import com.ikesocial.pvas.domain.service.FotoStorageService.NovaFoto;

@Service
public class CatalogoFotoAssistenteSocial {

	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;

	@Autowired
	private FotoStorageService fotoStorage;

	@Transactional
	public FotoPessoa salvar(FotoPessoa foto, InputStream dadosArquivo) {
		String nomeNovoArquivo = fotoStorage.gerarNomeArquivo(foto.getNomeArquivo());
		String nomeArquivoExistente = null;

		Optional<FotoPessoa> fotoExistente = assistenteSocialRepository.buscarFotoPorId(foto.getPessoa().getId());
		
		
		if (fotoExistente.isPresent()) {
			nomeArquivoExistente = fotoExistente.get().getNomeArquivo();
			assistenteSocialRepository.delete(fotoExistente.get());
		}

		foto.setNomeArquivo(nomeNovoArquivo);
		foto = assistenteSocialRepository.save(foto);
		
		assistenteSocialRepository.flush();

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
	    
	    assistenteSocialRepository.delete(foto);
	    assistenteSocialRepository.flush();

	    fotoStorage.remover(foto.getNomeArquivo());
	}

	public FotoPessoa buscarOuFalhar(String codigo) {
		return assistenteSocialRepository.buscarFotoPorCodigo(codigo)
				.orElseThrow(() -> new FotoAssistenteSocialNaoEncontradoException(codigo));
	}

}
