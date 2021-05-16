package brandaoti.sistema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import brandaoti.sistema.model.Categoria;
import brandaoti.sistema.model.Comodidade;
import brandaoti.sistema.model.Imobiliaria;
import brandaoti.sistema.model.Imovel;
import brandaoti.sistema.model.Lazer;
import brandaoti.sistema.model.Perfil;

public interface LazerDao extends JpaRepository<Lazer, Integer> {
	
	@Query(" select p from Lazer p where ativo = 1 order by nome asc")
	List<Lazer> buscarTudo();
	
		
	
}
