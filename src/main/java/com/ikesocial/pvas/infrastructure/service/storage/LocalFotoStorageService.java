package com.ikesocial.pvas.infrastructure.service.storage;

import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;

import com.ikesocial.pvas.core.storage.StorageProperties;
import com.ikesocial.pvas.domain.service.FotoStorageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LocalFotoStorageService implements FotoStorageService{

	@Autowired
	private StorageProperties storageProperties;
	
	@Override
	public void armazenar(NovaFoto novaFoto) {
		log.info("C=LocalFotoStorageService,M=armazenar, armazendo a foto {}",novaFoto.getNomeAquivo());
		
		try {
			Path arquivoPath = getArquivoPath(novaFoto.getNomeAquivo());
			
			FileCopyUtils.copy(novaFoto.getInputStream(), 
					Files.newOutputStream(arquivoPath));
		} catch (Exception e) {
			throw new StorageException("Não foi possível armazenar arquivo.", e);
		}
	}
	
	@Override
	public void remover(String nomeArquivo) {
		log.info("C=LocalFotoStorageService,M=remover, removendo a foto {}",nomeArquivo);
		try {
			Path arquivoPath = getArquivoPath(nomeArquivo);
			
			Files.deleteIfExists(arquivoPath);
		} catch (Exception e) {
			throw new StorageException("Não foi possível excluir arquivo.", e);
		}
	}
	
	@Override
	public FotoRecuperada recuperar(String nomeArquivo) {
		log.info("C=LocalFotoStorageService,M=recuperar, recuperando a foto {}",nomeArquivo);
		
	    try {
	        Path arquivoPath = getArquivoPath(nomeArquivo);
	        
	        FotoRecuperada fotoRecuperada = FotoRecuperada.builder()
					.inputStream(Files.newInputStream(arquivoPath))
					.build();

	        return fotoRecuperada;
	    } catch (Exception e) {
	        throw new StorageException("Não foi possível recuperar arquivo.", e);
	    }
	} 
	
	private Path getArquivoPath(String nomeArquivo) {
		log.info("C=LocalFotoStorageService,M=getArquivoPath, recuperando a foto {}",nomeArquivo);
		
		return storageProperties.getLocal()
				.getDiretorioFotos()
				.resolve(Path.of(nomeArquivo));
	}
	

}
