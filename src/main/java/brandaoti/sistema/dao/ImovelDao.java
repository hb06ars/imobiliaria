package brandaoti.sistema.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import brandaoti.sistema.model.Imovel;
import brandaoti.sistema.model.ObjetoCidadeEstado;

public interface ImovelDao extends JpaRepository<Imovel, Integer> {
	
	@Query(" select p from Imovel p where ativo = 1 order by id desc")
	List<Imovel> buscarTudo();
		
	@Query(" select p from Imovel p where p.ativo = 1 order by p.id desc ")
	List<Imovel> novos();
	
	@Query(" select CONCAT(p.cidade,'#',p.estado) from Imovel p where p.ativo = 1 group by p.cidade, p.estado order by p.cidade asc")
	List<String> buscarRegioes();
	
	@Query(" select p from Imovel p where p.ativo = 1 AND CAST(p.id as string) like (%:pesq_codigo%) AND CAST(p.salas as string) like IFNULL(:pesq_salas,'%%') AND CAST(p.vagas as string) like IFNULL(:pesq_vagas,'%%') AND CAST(p.quartos as string) like IFNULL(:pesq_quartos,'%%') AND CAST(p.banheiros as string) like IFNULL(:pesq_banheiros,'%%') AND CAST(p.tamanho as string) like IFNULL(:pesq_tamanho,'%%') AND lower(p.tipoImovel.nome) like (%:pesq_tipoImovel%) AND (  lower(p.rua) like (%:pesq_localizacao%) OR lower(p.cidade) like (%:pesq_localizacao%) OR lower(p.estado) like (%:pesq_localizacao%) OR lower(p.cep) like (%:pesq_localizacao%)  ) order by id desc")
	List<Imovel> filtro(@Param("pesq_codigo") String pesq_codigo, @Param("pesq_salas") String pesq_salas, @Param("pesq_vagas") String pesq_vagas, @Param("pesq_quartos") String pesq_quartos, @Param("pesq_banheiros") String pesq_banheiros, @Param("pesq_tamanho") String pesq_tamanho, @Param("pesq_tipoImovel") String pesq_tipoImovel, @Param("pesq_localizacao") String pesq_localizacao);
	//@Param("pesq_vagas") String pesq_vagas, @Param("pesq_quartos") String pesq_quartos, @Param("pesq_banheiros") String pesq_banheiros, @Param("pesq_tipoPagamento") String pesq_tipoPagamento , @Param("pesq_quartos") String pesq_quartos, @Param("pesq_banheiros") String pesq_banheiros, @Param("pesq_seguranca") String pesq_seguranca, @Param("pesq_comodidades") String pesq_comodidades, @Param("pesq_lazer") String pesq_lazer, @Param("pesq_precoDe") String pesq_precoDe, @Param("String") String pesq_precoAte 	
	// pesq_vagas, pesq_quartos, pesq_banheiros, 
}
