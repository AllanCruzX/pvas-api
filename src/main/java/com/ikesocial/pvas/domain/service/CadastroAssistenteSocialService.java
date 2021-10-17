package com.ikesocial.pvas.domain.service;

import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ikesocial.pvas.domain.exception.AssistenteSocialNaoEncontradoException;
import com.ikesocial.pvas.domain.exception.NegocioException;
import com.ikesocial.pvas.domain.model.AssistenteSocial;
import com.ikesocial.pvas.domain.model.Contato;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Documento;
import com.ikesocial.pvas.domain.model.Endereco;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Grupo;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.SubEspecialidade;
import com.ikesocial.pvas.domain.model.builder.ContatoBuilder;
import com.ikesocial.pvas.domain.model.builder.EnderecoBuilder;
import com.ikesocial.pvas.domain.model.enums.TipoDocumento;
import com.ikesocial.pvas.domain.repository.AssistenteSocialRepository;
import com.ikesocial.pvas.domain.repository.GrupoRepository;

@Service
public class CadastroAssistenteSocialService {

	

	@Autowired
	private AssistenteSocialRepository assistenteSocialRepository;
	
	@Autowired
	private GrupoRepository grupoRepository;
	
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
	public AssistenteSocial salvar(AssistenteSocial assistenteSocial) {
		
		assistenteSocialRepository.detach(assistenteSocial);
		
		preparaDocumento(assistenteSocial);
		preparaContato(assistenteSocial);
		preparaEndereco(assistenteSocial);
		preparaSubEspecialidade(assistenteSocial);
		preparaIdioma(assistenteSocial);
		preparaEspecializacao(assistenteSocial);
		preparaCurso(assistenteSocial);
		preparaExperienciaProfissional(assistenteSocial);
		associarGrupo(assistenteSocial);
		
		return assistenteSocialRepository.save(assistenteSocial);

	}
	
	@Transactional
	public void ativar(String codigoAssistenteSocial) {
		AssistenteSocial pessoaFisicaAtual = buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		pessoaFisicaAtual.ativar();
	}
	
	@Transactional
	public void inativar(String codigoAssistenteSocial) {
		AssistenteSocial assistenteSocial = buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		assistenteSocial.inativar();
	}
	
	@Transactional
	public void alterarSenha(String codigoAssistenteSocial, String senhaAtual, String novaSenha) {
		AssistenteSocial assistenteSocial = buscarOuFalharAssistenteSocialSemComplementos(codigoAssistenteSocial);
		
		if (assistenteSocial.senhaNaoCoincideCom(senhaAtual)) {
			throw new NegocioException("Senha atual informada não coincide com a senha do usuário.");
		}
		
		assistenteSocial.setSenha(novaSenha);
	}

	public AssistenteSocial buscarOuFalhar(String codigo) {
		
		try {
			return assistenteSocialRepository.buscarPorCodigo(codigo).get();
		} catch (EmptyResultDataAccessException e) {
			 throw new AssistenteSocialNaoEncontradoException(codigo);
			
		}
	}
	
	public AssistenteSocial buscarOuFalharAssistenteSocialSemComplementos(String codigo) {
		
			return assistenteSocialRepository.findByCodigo(codigo)
												.orElseThrow(() -> new AssistenteSocialNaoEncontradoException(codigo));
			
	}
	
	
	private void preparaSubEspecialidade(AssistenteSocial assistenteSocial) {
		if(assistenteSocial.getSubEspecialidades() != null && !assistenteSocial.getSubEspecialidades().isEmpty()) {
			Set<SubEspecialidade> subEspecialidades = assistenteSocial
														.getSubEspecialidades()
															.stream()
															.map(subEspecialidade -> subEspecialidadeService.buscarOuFalhar(subEspecialidade.getId()))
															.collect(Collectors.toSet());
	
		assistenteSocial.setSubEspecialidades(subEspecialidades);
		}
	}
	
	private void preparaIdioma(AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.getIdiomas() != null && !assistenteSocial.getIdiomas().isEmpty()) {
			
		Set<Idioma> idiomas = assistenteSocial.getIdiomas()
						.stream()
						.map(idioma -> idiomaService.buscarOuFalhar(idioma.getId()))
						.collect(Collectors.toSet());
		
		
			assistenteSocial.setIdiomas(idiomas);
		}
	}
	
	
	private void preparaCurso(AssistenteSocial assistenteSocial) {
		
		if( assistenteSocial.getCursos()!= null && !assistenteSocial.getCursos().isEmpty()) {
		
		Set<Curso> cursos = assistenteSocial.getCursos()
							.stream()
							.map(curso -> cursoService.buscarOuFalhar(curso.getId()))
							.collect(Collectors.toSet());
		
		
			assistenteSocial.setCursos(cursos);
		}
	}

	private void preparaEspecializacao(AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.getEspecializacoes() != null && !assistenteSocial.getEspecializacoes().isEmpty()) {
		
		Set<Especializacao> especializacoes = assistenteSocial.getEspecializacoes()
							.stream()
							.map(especializacao -> especializacaoService.buscarOuFalhar(especializacao.getId()))
							.collect(Collectors.toSet());
		
	
			assistenteSocial.setEspecializacoes(especializacoes);
		}
	}
	
	private void preparaExperienciaProfissional(AssistenteSocial assistenteSocial) {
		
		if(assistenteSocial.getExperieciasProfissionais()!= null && !assistenteSocial.getExperieciasProfissionais().isEmpty()) { 
		
		Set<ExperienciaProfissional> experienciasProfissionais = assistenteSocial.getExperieciasProfissionais()
									.stream()
									.map(experiencia -> experienciaProfissionalService.buscarOuFalhar(experiencia.getId()))
									.collect(Collectors.toSet());
		
			assistenteSocial.setExperieciasProfissionais(experienciasProfissionais);
		}
	}

	private void preparaEndereco(AssistenteSocial assistenteSocial) {
		Set<Endereco> enderecos = assistenteSocial.getEnderecos()
						.stream()
						.map(endereco -> montaEndereco(endereco ,assistenteSocial ) )
						.collect(Collectors.toSet());
		
		assistenteSocial.setEnderecos(enderecos);
	}
	
	private void preparaContato(AssistenteSocial assistenteSocial) {
		
		emailService.validaEmailfExistente(assistenteSocial.getContatos()); 
	   	    
	    Set<Contato> contatos = assistenteSocial.getContatos()
												.stream()
												.map(contato -> montaContato(contato , assistenteSocial))
												.collect(Collectors.toSet());
						
	    assistenteSocial.setContatos(contatos);
		
	}
	
	
	private void preparaDocumento(AssistenteSocial assistenteSocial) {
		
		Set<Documento> documentos = assistenteSocial.getDocumentos()
						.stream()
						.map(documento -> montaDocumento(documento ,assistenteSocial ))
						.collect(Collectors.toSet());
		
		assistenteSocial.setDocumentos(documentos);
	}
	
	private Documento montaDocumento (Documento documento , AssistenteSocial assistenteSocial) {
		
		TipoDocumento tipo = documento.getTipoDocumento();
		
		DocumentoStrategy documentoMontado = tipo.obterDocumento();
		
		documento  = documentoMontado.definirDocumento(documento ,estadoService, assistenteSocialRepository , assistenteSocial);
		
		return documento;
		
	}
	
	private Endereco  montaEndereco(Endereco endereco , AssistenteSocial assistenteSocial){
		
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
	
	private Contato  montaContato(Contato contato, AssistenteSocial assistenteSocial) {
		
		Contato contatoMontado = new ContatoBuilder()
											.comDescricao(contato.getDescricao())
											.comTipoContato(contato.getTipoContato())
											.comPessoaFisica(assistenteSocial)
											.construir();
		return contatoMontado;
												
	}
	
	private void associarGrupo (AssistenteSocial assistenteSocial) {
		Optional<Grupo> grupo = grupoRepository.findById(GrupoConstants.USUARIO);
		
		assistenteSocial.adicionarGrupo(grupo.get());
	}

}
