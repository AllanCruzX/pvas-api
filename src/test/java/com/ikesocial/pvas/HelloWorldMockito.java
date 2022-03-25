package com.ikesocial.pvas;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.util.Assert;

import com.ikesocial.pvas.domain.model.Cidade;
import com.ikesocial.pvas.domain.repository.CidadeRepository;


public class HelloWorldMockito {
	
    @Test
    void hello() {
    	
            CidadeRepository cidadeRepository = Mockito.mock(CidadeRepository.class);
            List<Cidade> cidades = (List<Cidade>) cidadeRepository.findAll();
            Assert.isTrue(cidades.isEmpty());
            
    }

}
