package com.ikesocial.pvas.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ikesocial.pvas.domain.model.Curriculo;
import com.ikesocial.pvas.domain.model.Curso;
import com.ikesocial.pvas.domain.model.Especialidade;
import com.ikesocial.pvas.domain.model.Especializacao;
import com.ikesocial.pvas.domain.model.ExperienciaProfissional;
import com.ikesocial.pvas.domain.model.Idioma;
import com.ikesocial.pvas.domain.model.Profissao;
import com.ikesocial.pvas.domain.model.Profissional;
import com.ikesocial.pvas.domain.model.SubEspecialidade;

@Repository
public interface CurriculoRepository extends CustomJpaRepository<Curriculo, Long>, CurriculoRepositoryQueries,
		JpaSpecificationExecutor<Profissional> {
	
	@Query(" SELECT c FROM Curriculo c  WHERE c.profissional.codigo = :codigoDoProfissional ")
	Optional<Curriculo> buscarCurriculoPeloCodigoDoProfissional(String codigoDoProfissional);
	
	@Query(" SELECT c FROM Curriculo c INNER JOIN FETCH  c.subEspecialidades cs INNER JOIN  cs.especialidade cse WHERE c.id = :curriculoId ")
	Optional<Curriculo> listarCurriculoComSubEspecialidades(Long curriculoId);
	
	@Query(" SELECT i FROM Idioma i ")
	List<Idioma> listarIdiomas();
	
	@Query(" SELECT i FROM Idioma i WHERE i.id = :idiomaId ")
	Optional<Idioma> buscarIdiomaPorId(Long idiomaId);

	@Query(" SELECT e FROM Especializacao e ")
	List<Especializacao>  listarEspecializacoes();
	
	@Query(" SELECT e FROM Especializacao e WHERE e.id = :especializacaoId")
	Optional<Especializacao> buscarEspecializacaoPorId(Long especializacaoId);
	
	@Query(" SELECT e FROM Especialidade e ")
	List<Especialidade>  listarEspecialidades();
	
	@Query(" SELECT e FROM Especialidade e WHERE e.id = :especialidadeId")
	Optional<Especialidade> buscarEspecialidadePorId(Long especialidadeId);
	
	@Query("SELECT s FROM SubEspecialidade s  WHERE s.id = :subEspecialidadeId ")
	Optional<SubEspecialidade> buscarSubEspecialidadePorId(Long subEspecialidadeId);
	
	@Query("SELECT s FROM SubEspecialidade s INNER JOIN FETCH  s.especialidade se WHERE se.id = :especialidadeId ORDER BY s.nome")
	List<SubEspecialidade> listarSubEspecialidadesPorEspecialidade(Long especialidadeId);
	
	@Query(" SELECT p FROM Profissao p ")
	List<Profissao>  listarProfissoes();
	
	@Query(" SELECT p FROM Profissao p WHERE p.id = :profissaoId ")
	Optional<Profissao> buscarProfissaoPorId(Long profissaoId);

	@Query(" SELECT c FROM Curso c  WHERE c.curriculo.id = :curriculoId ")
	List<Curso> lirtarCursosDoCurriculo (Long curriculoId);
	
	@Query(" SELECT c FROM Curso c  WHERE c.id = :cursoId ")
	Optional<Curso> buscarCursoPorId (Long cursoId);
	
	@Query(" SELECT e FROM ExperienciaProfissional e  WHERE e.curriculo.id = :curriculoId ")
	List<ExperienciaProfissional> lirtarExperienciasProfissionaisDoCurriculo (Long curriculoId);
	
	@Query(" SELECT e FROM ExperienciaProfissional e  WHERE e.id = :experienciaProfissionalId ")
	Optional<ExperienciaProfissional> buscarExperienciasProfissionalPorId (Long experienciaProfissionalId);
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM ExperienciaProfissional e WHERE e.id = :experienciaProfissionalId AND e.curriculo.id = :curriculoId ")
	boolean existeExperienciaProfissionalNoBancoParaOCurriculo(Long curriculoId, Long experienciaProfissionalId);
	
	@Query(" SELECT CASE WHEN COUNT(1) > 0 THEN true ELSE false END FROM Curso c WHERE c.id = :cursoId AND c.curriculo.id = :curriculoId ")
	boolean existeCursoNoBancoParaOCurriculo(Long curriculoId,Long cursoId);

	
}
