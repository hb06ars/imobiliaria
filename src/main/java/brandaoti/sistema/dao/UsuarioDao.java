package brandaoti.sistema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import brandaoti.sistema.model.Imovel;
import brandaoti.sistema.model.Usuario;

public interface UsuarioDao extends JpaRepository<Usuario, Integer> {
	@Query(" select u from Usuario u where upper( u.login ) like upper( :login ) and upper( u.senha ) like upper( :senha ) ")
	Usuario fazerLogin(@Param("login") String login, @Param("senha") String senha);
	
	@Query(" select u from Usuario u where upper( u.login ) like upper( :login )")
	List<Usuario> buscarClientesRepetidos(@Param("login") String login);
	
	@Query(" select p from Usuario p where ativo = TRUE")
	List<Usuario> buscarTudo();
	
	
}
