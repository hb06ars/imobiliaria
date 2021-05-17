package brandaoti.sistema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import brandaoti.sistema.model.Imovel;
import brandaoti.sistema.model.News;
import brandaoti.sistema.model.Perfil;

public interface NewsDao extends JpaRepository<News, Integer> {
	
	
	@Query(" select p from News p order by id desc")
	List<News> buscarTudo();
}
