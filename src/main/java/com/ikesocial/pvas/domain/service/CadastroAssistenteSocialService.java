package com.ikesocial.pvas.domain.service;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.PessoaFisica;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.model.builder.ContatoBuilder;
import com.ikesocial.pvas.domain.model.builder.EnderecoBuilder;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;

@Service
public class CadastroAssistenteSocialService {

	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;
	
	@Autowired
	private CadastroEstadoService estadoService;
	
	@Autowired
	private CadastroCidadeService cidadeService;
	
	@Autowired
	private CadastroSubEspecialidadeService subEspecialidadeService;
	
	@Autowired
	private CadastroIdiomaService idiomaService;
	
	@Autowired
	private CadastroEspecializacaoService especializacaoService;
	
	@Autowired
	private CadastroCursoService cursoService;
	
	@Autowired
	private CadastroExperienciaProfissionalService experienciaProfissionalService;
	
	@Autowired
	private EmailService emailService;

	@Transactional
	public PessoaFisica salvar(PessoaFisica assistenteSocial) {
		
		assistenteSocialRepository.detach(assistenteSocial);
		
		preparaDocumento(assistenteSocial);
		preparaContato(assistenteSocial);
		preparaEndereco(assistenteSocial);
		preparaSubEspecialidade(assistenteSocial);
		preparaIdioma(assistenteSocial);
		preparaEspecializacao(assistenteSocial);
		preparaCurso(assistenteSocial);
		preparaExperienciaProfissional(assistenteSocial);
		
		return assistenteSocialRepository.save(assistenteSocial);

	}
	
	@Transactional
	public void ativar(String codigoAssistenteSocial) {
		PessoaFisica pessoaFisicaAtual = buscarOuFalhar(codigoAssistenteSocial);
		
		pessoaFisicaAtual.ativar();
	}
	
	@Transactional
	public void inativar(String codigoAssistenteSocial) {
		PessoaFisica assistenteSocial = buscarOuFalhar(codigoAssistenteSocial);
		
		assistenteSocial.inativar();
	}

	public PessoaFisica buscarOuFalhar(String codigo) {
		
		try {
			return assistenteSocialRepository.buscarPorCodigo(codigo).get();
		} catch (EmptyResultDataAccessException e) {
			 throw new AssistenteSocialNaoEncontradoException(codigo);
			
		}
	}
	
	public PessoaFisica buscarOuFalharAssistenteSocialSemComplementos(String codigo) {
		
			return assistenteSocialRepository.findByCodigo(codigo)
												.orElseThrow(() -> new AssistenteSocialNaoEncontradoException(codigo));
			
	}
	
	
	private void preparaSubEspecialidade(PessoaFisica assistenteSocial) {
		if(assistenteSocial.getSubEspecialidades() != null && !assistenteSocial.getSubEspecialidades().isEmpty()) {
			Set<SubEspecialidade> subEspecialidades = assistenteSocial
														.getSubEspecialidades()
															.stream()
															.map(subEspecialidade -> subEspecialidadeService.buscarOuFalhar(subEspecialidade.getId()))
															.collect(Collectors.toSet());
	
		assistenteSocial.setSubEspecialidades(subEspecialidades);
		}
	}
	
	private void preparaIdioma(PessoaFisica assistenteSocial) {
		
		if(assistenteSocial.getIdiomas() != null && !assistenteSocial.getIdiomas().isEmpty()) {
			
		Set<Idioma> idiomas = assistenteSocial.getIdiomas()
						.stream()
						.map(idioma -> idiomaService.buscarOuFalhar(idioma.getId()))
						.collect(Collectors.toSet());
		
		
			assistenteSocial.setIdiomas(idiomas);
		}
	}
	
	
	private void preparaCurso(PessoaFisica assistenteSocial) {
		
		if( assistenteSocial.getCursos()!= null && !assistenteSocial.getCursos().isEmpty()) {
		
		Set<Curso> cursos = assistenteSocial.getCursos()
							.stream()
							.map(curso -> cursoService.buscarOuFalhar(curso.getId()))
							.collect(Collectors.toSet());
		
		
			assistenteSocial.setCursos(cursos);
		}
	}

	private void preparaEspecializacao(PessoaFisica assistenteSocial) {
		
		if(assistenteSocial.getEspecializacoes() != null && !assistenteSocial.getEspecializacoes().isEmpty()) {
		
		Set<Especializacao> especializacoes = assistenteSocial.getEspecializacoes()
							.stream()
							.map(especializacao -> especializacaoService.buscarOuFalhar(especializacao.getId()))
							.collect(Collectors.toSet());
		
	
			assistenteSocial.setEspecializacoes(especializacoes);
		}
	}
	
	private void preparaExperienciaProfissional(PessoaFisica assistenteSocial) {
		
		if(assistenteSocial.getExperieciasProfissionais()!= null && !assistenteSocial.getExperieciasProfissionais().isEmpty()) { 
		
		Set<ExperienciaProfissional> experienciasProfissionais = assistenteSocial.getExperieciasProfissionais()
									.stream()
									.map(experiencia -> experienciaProfissionalService.buscarOuFalhar(experiencia.getId()))
									.collect(Collectors.toSet());
		
			assistenteSocial.setExperieciasProfissionais(experienciasProfissionais);
		}
	}

	private void preparaEndereco(PessoaFisica assistenteSocial) {
		Set<Endereco> enderecos = assistenteSocial.getEnderecos()
						.stream()
						.map(endereco -> montaEndereco(endereco ,assistenteSocial ) )
						.collect(Collectors.toSet());
		
		assistenteSocial.setEnderecos(enderecos);
	}
	
	private void preparaContato(PessoaFisica assistenteSocial) {
		
		emailService.validaEmailfExistente(assistenteSocial.getContatos()); 
	   	    
	    Set<Contato> contatos = assistenteSocial.getContatos()
												.stream()
												.map(contato -> montaContato(contato , assistenteSocial))
												.collect(Collectors.toSet());
						
	    assistenteSocial.setContatos(contatos);
		
	}
	
	
	private void preparaDocumento(PessoaFisica assistenteSocial) {
		
		Set<Documento> documentos = assistenteSocial.getDocumentos()
						.stream()
						.map(documento -> montaDocumento(documento ,assistenteSocial ))
						.collect(Collectors.toSet());
		
		assistenteSocial.setDocumentos(documentos);
	}
	
	private Documento montaDocumento (Documento documento , PessoaFisica assistenteSocial) {
		
		TipoDocumento tipo = documento.getTipoDocumento();
		
		DocumentoStrategy documentoMontado = tipo.obterDocumento();
		
		documento  = documentoMontado.definirDocumento(documento ,estadoService, assistenteSocialRepository , assistenteSocial);
		
		return documento;
		
	}
	
	private Endereco  montaEndereco(Endereco endereco , PessoaFisica assistenteSocial){
		
		Endereco enderecoMontado = new EnderecoBuilder()
											.comCep(endereco.getCep())
											.comLogradouro(endereco.getLogradouro())
											.comBairro(endereco.getBairro())
											.comNumero(endereco.getNumero())
											.comComplemento(endereco.getComplemento())
											.comCidade(cidadeService.buscarOuFalhar(endereco.getCidade().getId()))
											.comPessoaFisica(assistenteSocial)
											.definirComoResidencial()
											.definirComoPrincipal(true)
											.construir();
		
		return enderecoMontado;
		
	}
	
	private Contato  montaContato(Contato contato, PessoaFisica assistenteSocial) {
		
		Contato contatoMontado = new ContatoBuilder()
											.comDescricao(contato.getDescricao())
											.comTipoContato(contato.getTipoContato())
											.comPessoaFisica(assistenteSocial)
											.construir();
		return contatoMontado;
												
	}

}
