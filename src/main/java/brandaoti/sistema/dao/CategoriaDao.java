package brandaoti.sistema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import brandaoti.sistema.model.Categoria;
import brandaoti.sistema.model.Imovel;
import brandaoti.sistema.model.Perfil;

public interface CategoriaDao extends JpaRepository<Categoria, Integer> {
	
	@Query(" select p from Categoria p where ativo = 1 order by nome asc")
	List<Categoria> buscarTudo();
	
	@Query(" select p from Categoria p where upper( p.codigo ) like upper( :codigo ) and ativo = 1 ")
	Categoria buscarCodigo(@Param("codigo") String codigo);
	
		
	
}
