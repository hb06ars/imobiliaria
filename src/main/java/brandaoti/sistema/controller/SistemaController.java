package brandaoti.sistema.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import brandaoti.sistema.dao.CategoriaDao;
import brandaoti.sistema.dao.ComodidadeDao;
import brandaoti.sistema.dao.ImobiliariaDao;
import brandaoti.sistema.dao.ImovelDao;
import brandaoti.sistema.dao.LazerDao;
import brandaoti.sistema.dao.NewsDao;
import brandaoti.sistema.dao.PerfilDao;
import brandaoti.sistema.dao.SegurancaDao;
import brandaoti.sistema.dao.StatusImovelDao;
import brandaoti.sistema.dao.TipoImovelDao;
import brandaoti.sistema.dao.TipoPagamentoDao;
import brandaoti.sistema.dao.UsuarioDao;
import brandaoti.sistema.model.Categoria;
import brandaoti.sistema.model.Comodidade;
import brandaoti.sistema.model.Imobiliaria;
import brandaoti.sistema.model.Imovel;
import brandaoti.sistema.model.Lazer;
import brandaoti.sistema.model.News;
import brandaoti.sistema.model.ObjetoCidadeEstado;
import brandaoti.sistema.model.Perfil;
import brandaoti.sistema.model.Seguranca;
import brandaoti.sistema.model.StatusImovel;
import brandaoti.sistema.model.TipoImovel;
import brandaoti.sistema.model.TipoPagamento;
import brandaoti.sistema.model.Usuario;


@RestController
@RequestMapping("/")
@CrossOrigin("*")
public class SistemaController extends HttpServlet {
		private static final long serialVersionUID = 1L;
		
		@Autowired
		private UsuarioDao usuarioDao;
		@Autowired
		private PerfilDao perfilDao;
		@Autowired
		private CategoriaDao categoriaDao;
		@Autowired
		private ComodidadeDao comodidadeDao;
		@Autowired
		private ImobiliariaDao imobiliariaDao;
		@Autowired
		private ImovelDao imovelDao;
		@Autowired
		private LazerDao lazerDao;
		@Autowired
		private SegurancaDao segurancaDao;
		@Autowired
		private StatusImovelDao statusImovelDao;
		@Autowired
		private TipoImovelDao tipoImovelDao;
		@Autowired
		private TipoPagamentoDao tipoPagamentoDao;
		@Autowired
		private NewsDao newsDao;

		public void iniciar() {
			if(usuarioDao.findAll().size() == 0) {
				Usuario u = new Usuario();
				u.setGravacao(true);
				u.setLogin("adm");
				u.setNome("Admnistrador");
				u.setSenha("adm");
				usuarioDao.save(u);
			}
			
			
			
			List<Perfil> perfis = perfilDao.findAll();
			List<Seguranca> seguranca = segurancaDao.findAll();		
			List<Comodidade> comodidade = comodidadeDao.findAll();	
			List<Lazer> lazer = lazerDao.findAll();			
			List<Imobiliaria> imobiliaria = imobiliariaDao.findAll();
			List<Imovel> imovel = imovelDao.findAll();
			
			if(perfis.size() == 0 && seguranca.size() == 0  && comodidade.size() == 0 && lazer.size() == 0 && imobiliaria.size() == 0) {
				//Perfil 	---------------------------
				Perfil p = new Perfil();
				p.setAtivo(true);
				p.setCodigo("1");
				p.setNome("Admnistrador");
				p.setAdmin(true);
				perfilDao.save(p);
				p = new Perfil();
				p.setAtivo(true);
				p.setCodigo("2");
				p.setNome("Cliente");
				p.setCliente(true);
				perfilDao.save(p);
				p = new Perfil();
				p.setAtivo(true);
				p.setCodigo("3");
				p.setNome("Funcion??rio");
				p.setFuncionario(true);
				perfilDao.save(p);
				//Categoria	----------------------------
				Categoria c = new Categoria();
				c.setCodigo("1");
				c.setDescricao("Residencial");
				c.setNome("Residencial");
				categoriaDao.save(c);
				c = new Categoria();
				c.setCodigo("2");
				c.setDescricao("Comercial");
				c.setNome("Comercial");
				categoriaDao.save(c);
				//Tipo Imovel	----------------------------
				TipoImovel ti = new TipoImovel();
				ti.setCodigo("1");
				ti.setDescricao("Casa");
				ti.setNome("Casa");
				tipoImovelDao.save(ti);
				ti = new TipoImovel();
				ti.setCodigo("2");
				ti.setDescricao("Apartamento");
				ti.setNome("Apartamento");
				tipoImovelDao.save(ti);
				ti = new TipoImovel();
				ti.setCodigo("3");
				ti.setDescricao("Condom??nio");
				ti.setNome("Condom??nio");
				tipoImovelDao.save(ti);
				//statusImovel	----------------------------
				StatusImovel si = new StatusImovel();
				si.setCodigo("1");
				si.setDescricao("Pronto para morar");
				si.setNome("Pronto para morar");
				statusImovelDao.save(si);
				si = new StatusImovel();
				si.setCodigo("2");
				si.setDescricao("Na Planta");
				si.setNome("Na Planta");
				statusImovelDao.save(si);
				si = new StatusImovel();
				si.setCodigo("3");
				si.setDescricao("Em Constru????o");
				si.setNome("Em Constru????o");
				statusImovelDao.save(si);
				//seguranca	----------------------------
				Seguranca se = new Seguranca();
				se.setDescricao("Seguran??a 24hs");
				se.setNome("Seguran??a 24hs");
				segurancaDao.save(se);
				se = new Seguranca();
				se.setDescricao("Vigia");
				se.setNome("Vigia");
				segurancaDao.save(se);
				se = new Seguranca();
				se.setDescricao("Interfone");
				se.setNome("Interfone");
				segurancaDao.save(se);
				//comodidade	----------------------------
				Comodidade co = new Comodidade();
				co.setDescricao("Elevador");
				co.setNome("Elevador");
				comodidadeDao.save(co);
				co = new Comodidade();
				co.setDescricao("Ar Condicionado");
				co.setNome("Ar Condicionado");
				comodidadeDao.save(co);
				co = new Comodidade();
				co.setDescricao("Academia");
				co.setNome("Academia");
				comodidadeDao.save(co);
				//lazer	----------------------------
				Lazer la = new Lazer();
				la.setDescricao("Piscina");
				la.setNome("Piscina");
				lazerDao.save(la);
				la = new Lazer();
				la.setDescricao("Quadra");
				la.setNome("Quadra");
				lazerDao.save(la);
				la = new Lazer();
				la.setDescricao("Cinema");
				la.setNome("Cinema");
				lazerDao.save(la);
				//imobiliaria	----------------------------
				Imobiliaria im = new Imobiliaria();
				im.setCnpj("999999999999");
				im.setCodigo("1");
				im.setContato("(11)99999-8888");
				im.setDescricao("Imobiliaria 123");
				im.setNome("Imobiliaria 123");
				im.setResponsavel("Juca");
				imobiliariaDao.save(im);
				//TipoPagamento -----------------------
				TipoPagamento tp = new TipoPagamento();
				tp.setCodigo("1");
				tp.setDescricao("Vender");
				tp.setNome("Vender");
				tipoPagamentoDao.save(tp);
				tp = new TipoPagamento();
				tp.setCodigo("2");
				tp.setDescricao("Alugar");
				tp.setNome("Alugar");
				tipoPagamentoDao.save(tp);
				//Im??vel	---------------------------
				Imovel imo = new Imovel();
				imo.setTamanho(50);
				imo.setQuartos(2);
				imo.setBanheiros(1);
				imo.setSalas(1);
				imo.setVagas(2);
				imo.setAtivo(true);
				imo.setBairro("Jd da Alegria");
				imo.setCategoria(categoriaDao.findAll().get(0));
				imo.setCep("11111-111");
				imo.setCidade("S??o Paulo");
				List<Comodidade> como = new ArrayList<Comodidade>();
				como.add(comodidadeDao.findAll().get(0));
				imo.setComodidade(como);
				imo.setCondominio(null);
				imo.setResponsavel("Juca");
				imo.setContatoResponsavel("(11)99999-9999");
				imo.setDescricao("Casa teste 123");
				imo.setEstado("S??o Paulo");
				imo.setImagem1("https://www.galeriadaarquitetura.com.br/Img/projeto/702x415/5651/casa-113917.jpg");
				imo.setImagem2("https://www.decorfacil.com/wp-content/uploads/2017/03/20171011fachada-casa-simples-pequena-99-960x600.jpg");
				imo.setImagem3("https://s2.glbimg.com/l5tf5ALrBpZgm6SyiYv55yoUlh0=/620x413/smart/e.glbimg.com/og/ed/f/original/2020/01/20/leve-e-iluminada-esta-casa-na-bahia-mistura-estrutura-metalica-madeira-e-vidro_9.jpg");
				imo.setImagem4("https://casa.abril.com.br/wp-content/uploads/2020/09/empresa-imprime-casas-em-3d-para-enfrentar-crise-imobiliaria-casa.com-1.jpg?quality=95&strip=info&w=1024");
				List<Imobiliaria> imobil = new ArrayList<Imobiliaria>();
				imobil.add(imobiliariaDao.findAll().get(0));
				imo.setImobiliaria(imobil);
				List<Lazer> laz = new ArrayList<Lazer>();
				laz.add(lazerDao.findAll().get(0));
				imo.setLazer(laz);
				imo.setPreco(123999.88);
				imo.setResponsavel("Jo??o");
				imo.setRua("Rua da Amizade");
				List<Seguranca> seg = new ArrayList<Seguranca>();
				seg.add(segurancaDao.findAll().get(0));
				imo.setSeguranca(seg);
				imo.setStatusImovel(statusImovelDao.findAll().get(0));
				imo.setTipoImovel(tipoImovelDao.findAll().get(0));
				List<TipoPagamento> tpgo = new ArrayList<TipoPagamento>();
				tpgo.add(tipoPagamentoDao.findAll().get(0));
				tpgo.add(tipoPagamentoDao.findAll().get(1));
				imo.setTipoPagamento(tpgo);
				imo.setEnderecoGoogleMap("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.1977213285913!2d-46.65867588549143!3d-23.561341267475594!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce59c8da0aa315%3A0xd59f9431f2c9776a!2sAv.%20Paulista%2C%20S%C3%A3o%20Paulo%20-%20SP!5e0!3m2!1spt-BR!2sbr!4v1620826853708!5m2!1spt-BR!2sbr");
				imovelDao.save(imo);
				
				imo = new Imovel();
				imo.setTamanho(100);
				imo.setQuartos(3);
				imo.setBanheiros(2);
				imo.setSalas(2);
				imo.setVagas(3);
				imo.setAtivo(true);
				imo.setBairro("Jd da Paz");
				imo.setCategoria(categoriaDao.findAll().get(0));
				imo.setCep("11111-222");
				imo.setCidade("Osasco");
				List<Comodidade> comob = new ArrayList<Comodidade>();
				comob.add(comodidadeDao.findAll().get(1));
				imo.setComodidade(comob);
				imo.setCondominio(null);
				imo.setResponsavel("Jorge");
				imo.setContatoResponsavel("(11)89999-9999");
				imo.setDescricao("Casa teste 567");
				imo.setEstado("S??o Paulo");
				imo.setImagem1("https://www.galeriadaarquitetura.com.br/Img/projeto/702x415/5651/casa-113917.jpg");
				imo.setImagem2("https://www.decorfacil.com/wp-content/uploads/2017/03/20171011fachada-casa-simples-pequena-99-960x600.jpg");
				imo.setImagem3("https://s2.glbimg.com/l5tf5ALrBpZgm6SyiYv55yoUlh0=/620x413/smart/e.glbimg.com/og/ed/f/original/2020/01/20/leve-e-iluminada-esta-casa-na-bahia-mistura-estrutura-metalica-madeira-e-vidro_9.jpg");
				imo.setImagem4("https://casa.abril.com.br/wp-content/uploads/2020/09/empresa-imprime-casas-em-3d-para-enfrentar-crise-imobiliaria-casa.com-1.jpg?quality=95&strip=info&w=1024");
				List<Imobiliaria> imobilb = new ArrayList<Imobiliaria>();
				imobilb.add(imobiliariaDao.findAll().get(0));
				imo.setImobiliaria(imobilb);
				List<Lazer> lazb = new ArrayList<Lazer>();
				lazb.add(lazerDao.findAll().get(0));
				imo.setLazer(lazb);
				imo.setPreco(333999.88);
				imo.setResponsavel("Ana");
				imo.setRua("Rua S??o Jorge");
				List<Seguranca> segb = new ArrayList<Seguranca>();
				segb.add(segurancaDao.findAll().get(1));
				imo.setSeguranca(segb);
				imo.setStatusImovel(statusImovelDao.findAll().get(0));
				imo.setTipoImovel(tipoImovelDao.findAll().get(0));
				List<TipoPagamento> tpgob = new ArrayList<TipoPagamento>();
				tpgob.add(tipoPagamentoDao.findAll().get(1));
				imo.setTipoPagamento(tpgob);
				imo.setEnderecoGoogleMap("https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.1977213285913!2d-46.65867588549143!3d-23.561341267475594!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce59c8da0aa315%3A0xd59f9431f2c9776a!2sAv.%20Paulista%2C%20S%C3%A3o%20Paulo%20-%20SP!5e0!3m2!1spt-BR!2sbr!4v1620826853708!5m2!1spt-BR!2sbr");
				imovelDao.save(imo);
				
				// ------------------------------------
			}
		}
		
		
		public void resetaMes(Integer mesSelecionado, Integer anoSelecionado) {
			Calendar calendar = new GregorianCalendar();
			mesSelecionado = calendar.get(Calendar.MONTH);
			mesSelecionado = mesSelecionado+1;
			anoSelecionado = calendar.get(Calendar.YEAR);
		}
		
		@RequestMapping(value = {"/","/index"}, produces = "text/plain;charset=UTF-8", method = {RequestMethod.POST, RequestMethod.GET}) // Pagina de Vendas
		public void login(HttpServletRequest request, HttpServletResponse response, String acao ,String pesq_codigo,String pesq_localizacao , String pesq_salas, String pesq_tamanho , String pesq_tipoImovel ,String pesq_tipoPagamento ,String pesq_vagas, String pesq_quartos ,String pesq_banheiros ,String pesq_seguranca ,String pesq_comodidades ,String pesq_lazer ,String pesq_precoDe ,String pesq_precoAte) throws SQLException, ServletException, IOException { //Funcao e alguns valores que recebe...
			HttpSession session = request.getSession();
			Usuario usuario = new Usuario();
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			Boolean validacaoInicial = false;
			if(session.getAttribute("validacaoInicial") != null) {
				validacaoInicial = (Boolean) session.getAttribute("validacaoInicial");
			}
			if(validacaoInicial == false) {
					iniciar();
			}
			List<Perfil> perfis = perfilDao.findAll();
			List<Seguranca> seguranca = segurancaDao.findAll();		
			List<Comodidade> comodidade = comodidadeDao.findAll();	
			List<Lazer> lazer = lazerDao.findAll();			
			List<Imobiliaria> imobiliaria = imobiliariaDao.findAll();
			
			List<Imovel> imovel = imovelDao.novos();
			List<Imovel> imoveisSistema = new ArrayList<Imovel>();
			int cont = 0;
			if(acao == null) {
				cont = 0;
				imovel = imovelDao.novos();
				for(Imovel i : imovel) {
					if(cont < 5) {
						imoveisSistema.add(i);
					} else {
						break;
					}
				}
			} else {
				if(acao.equals("pesquisar")) {
					//Quando houver pesquisa...
					if(pesq_codigo == null) pesq_codigo = "";
					if(pesq_localizacao == null) pesq_localizacao = "";
					if(pesq_tipoImovel == null || pesq_tipoImovel.toLowerCase().equals("todos")) pesq_tipoImovel = "";
					if(pesq_tipoPagamento == null || pesq_tipoPagamento.toLowerCase().equals("todos")) pesq_tipoPagamento = "";
					if(pesq_quartos == null || pesq_quartos.toLowerCase().equals("todos")) pesq_quartos = null;
					if(pesq_vagas == null || pesq_vagas.toLowerCase().equals("todos")) pesq_vagas = null;
					if(pesq_salas == null || pesq_salas.toLowerCase().equals("todos")) pesq_salas = null;
					if(pesq_tamanho == null || pesq_tamanho.toLowerCase().equals("")) pesq_tamanho = null;
					if(pesq_banheiros == null || pesq_banheiros.toLowerCase().equals("todos")) pesq_banheiros = null;
					if(pesq_seguranca == null || pesq_seguranca.toLowerCase().equals("todos")) pesq_seguranca = "";
					if(pesq_comodidades == null || pesq_comodidades.toLowerCase().equals("todos")) pesq_comodidades = "";
					if(pesq_lazer == null || pesq_lazer.toLowerCase().equals("todos")) pesq_lazer = "";
					if(pesq_precoDe == null || pesq_precoDe.toLowerCase().equals("m??nimo")) pesq_precoDe = "";
					if(pesq_precoAte == null || pesq_precoAte.toLowerCase().equals("m??ximo")) pesq_precoAte = "";
					
					pesq_codigo = pesq_codigo.toLowerCase();
					pesq_localizacao = pesq_localizacao.toLowerCase();
					pesq_tipoImovel = pesq_tipoImovel.toLowerCase();
					pesq_tipoPagamento = pesq_tipoPagamento.toLowerCase();
					pesq_seguranca = pesq_seguranca.toLowerCase();
					pesq_comodidades = pesq_comodidades.toLowerCase();
					pesq_lazer = pesq_lazer.toLowerCase();
					pesq_precoDe = pesq_precoDe.toLowerCase();
					pesq_precoAte = pesq_precoAte.toLowerCase();
					
					cont = 0;
					Boolean valido = true;
					Integer invalido = 0;
					imovel = imovelDao.filtro( pesq_codigo, pesq_salas, pesq_vagas, pesq_quartos, pesq_banheiros, pesq_tamanho , pesq_tipoImovel, pesq_localizacao );
					//  pesq_tipoPagamento, pesq_seguranca, pesq_comodidades, pesq_lazer, pesq_precoDe, pesq_precoAte
					for(Imovel i : imovel) {
						if(
								!pesq_tipoPagamento.toLowerCase().equals("") || 
								!pesq_seguranca.toLowerCase().equals("") || 
								!pesq_comodidades.toLowerCase().equals("") || 
								!pesq_lazer.toLowerCase().equals("") || 
								!pesq_precoDe.toLowerCase().equals("") || 
								!pesq_precoAte.toLowerCase().equals("")
							) {
							valido = false;
							
							if(i.getTipoPagamento().size() > 0 && !pesq_tipoPagamento.equals("")) {
								valido = false;
								for(TipoPagamento o : i.getTipoPagamento()) {
									if(o.getNome().toLowerCase().equals(pesq_tipoPagamento)){
										valido = true;
										break;
									}
								}
								if(!valido) invalido++;
							}
							
							if(i.getSeguranca().size() > 0 && !pesq_seguranca.equals("")) {
								valido = false;
								for(Seguranca o : i.getSeguranca()) {
									if(o.getNome().toLowerCase().equals(pesq_seguranca)){
										valido = true;
										break;
									}
								}
								if(!valido) invalido++;
							}
							
							if(i.getComodidade().size() > 0 && !pesq_comodidades.equals("")) {
								valido = false;
								for(Comodidade o : i.getComodidade()) {
									if(o.getNome().toLowerCase().equals(pesq_comodidades)){
										valido = true;
										break;
									}
								}
								if(!valido) invalido++;
							}
							
							if(i.getLazer().size() > 0 && !pesq_lazer.equals("")) {
								valido = false;
								for(Lazer o : i.getLazer()) {
									if(o.getNome().toLowerCase().equals(pesq_lazer)){
										valido = true;
										break;
									}
								}
								if(!valido) invalido++;
							}
							
							if(!pesq_precoDe.equals("") && pesq_precoAte.equals("")) {
								if(i.getPreco() >= Integer.parseInt(pesq_precoDe.replace(".", ""))){
								valido = true;
								}
							}
							if(!pesq_precoAte.equals("") && pesq_precoDe.equals("")) {
								if(i.getPreco() <= Integer.parseInt(pesq_precoAte.replace(".", ""))){
								valido = true;
								}
							}
							if(!pesq_precoDe.equals("") && !pesq_precoAte.equals("")) {
								if(i.getPreco() >= Integer.parseInt(pesq_precoDe.replace(".", "")) && i.getPreco() <= Integer.parseInt(pesq_precoAte.replace(".", ""))){
									valido = true;
								}
							}
							
						}
						if(valido && invalido == 0) {
							imoveisSistema.add(i);
						}
					}
				}
			}
			
			
			List<TipoImovel> tipos = tipoImovelDao.buscarTudo();
			List<TipoPagamento> tipoPagamento = tipoPagamentoDao.buscarTudo();
			List<Seguranca> segurancaLista = segurancaDao.buscarTudo();
			List<Comodidade> comodidadeLista = comodidadeDao.buscarTudo();
			List<Lazer> lazerLista = lazerDao.buscarTudo();
			
			String link = "index";
			String itemMenu = link;
			 //JSP que ir???? acessar
			request.setAttribute("pesq_codigo", pesq_codigo);
			request.setAttribute("pesq_localizacao", pesq_localizacao);
			request.setAttribute("pesq_salas", pesq_salas);
			request.setAttribute("pesq_tamanho", pesq_tamanho);
			request.setAttribute("pesq_tipoImovel", pesq_tipoImovel);
			request.setAttribute("pesq_tipoPagamento", pesq_tipoPagamento);
			request.setAttribute("pesq_vagas", pesq_vagas);
			request.setAttribute("pesq_quartos", pesq_quartos);
			request.setAttribute("pesq_banheiros", pesq_banheiros);
			request.setAttribute("pesq_seguranca", pesq_seguranca);
			request.setAttribute("pesq_comodidades", pesq_comodidades);
			request.setAttribute("pesq_lazer", pesq_lazer);
			request.setAttribute("pesq_precoDe", pesq_precoDe);
			request.setAttribute("pesq_precoAte", pesq_precoAte);
			
			request.setAttribute("imoveisSistema", imoveisSistema);
			request.setAttribute("tipoPagamento", tipoPagamento);
			request.setAttribute("segurancaLista", segurancaLista);
			request.setAttribute("comodidadeLista", comodidadeLista);
			request.setAttribute("lazerLista", lazerLista);
			request.setAttribute("tipos", tipos);
			request.setAttribute("acao", acao);
			
			request.setAttribute("news", newsDao.findAll());
			
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); //retorna a variavel
		}
		
		
		@RequestMapping(value = "/deslogar", method = {RequestMethod.POST, RequestMethod.GET}) // Link que ir???? acessar...
		public void deslogar(HttpServletRequest request, HttpServletResponse response) throws IOException { //Funcao e alguns valores que recebe...
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("/");
		}
		
		
		@RequestMapping(value = "/deletando", method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void deletando(HttpServletRequest request, HttpServletResponse response, String tabela,Integer id) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String paginaAtual = "Imovel";
			String iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
			String link = "branco";
			String itemMenu = link;
			 //JSP que ir?? acessar.
			String atualizarPagina = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			if(logado) {
				//Caso esteja logado.
				if(tabela.equals("imovel")) {
					link = "/cadastrar_imoveis";
					
					paginaAtual = "Clientes";
					Imovel objeto = imovelDao.findById(id).get();
					objeto.setAtivo(false);
					imovelDao.delete(objeto);
					List<Imovel> imoveis = imovelDao.buscarTudo();
					atualizarPagina = "/cadastrar_imoveis";
				}
				if(tabela.equals("usuario")) {
					link = "/cadastrar_usuarios";
					
					paginaAtual = "Usuarios";
					Usuario objeto = usuarioDao.findById(id).get();
					objeto.setAtivo(false);
					usuarioDao.delete(objeto);
					List<Usuario> usuarios = usuarioDao.buscarTudo();
					atualizarPagina = "/cadastrar_usuarios";
				}
				if(tabela.equals("imobiliaria")) {
					link = "/cadastrar_imobiliarias";
					
					paginaAtual = "Imobili??ria";
					Imobiliaria objeto = imobiliariaDao.findById(id).get();
					objeto.setAtivo(false);
					imobiliariaDao.delete(objeto);
					List<Imobiliaria> imobiliarias = imobiliariaDao.buscarTudo();
					atualizarPagina = "/cadastrar_imobiliarias";
				}
				if(tabela.equals("comodidade")) {
					link = "/cadastrar_especificacoes";
					
					paginaAtual = "Comodidade";
					Comodidade objeto = comodidadeDao.findById(id).get();
					objeto.setAtivo(false);
					comodidadeDao.save(objeto);
					atualizarPagina = "/cadastrar_especificacoes";
				}
				if(tabela.equals("lazer")) {
					link = "/cadastrar_especificacoes";
					
					paginaAtual = "Lazer";
					Lazer objeto = lazerDao.findById(id).get();
					objeto.setAtivo(false);
					lazerDao.save(objeto);
					atualizarPagina = "/cadastrar_especificacoes";
				}
				if(tabela.equals("seguranca")) {
					link = "/cadastrar_especificacoes";
					
					paginaAtual = "Seguran??a";
					Seguranca objeto = segurancaDao.findById(id).get();
					objeto.setAtivo(false);
					segurancaDao.save(objeto);
					atualizarPagina = "/cadastrar_especificacoes";
				}
				if(tabela.equals("news")) {
					link = "/cadastrar_news";
					
					paginaAtual = "News";
					News objeto = newsDao.findById(id).get();
					newsDao.delete(objeto);
					atualizarPagina = "/cadastrar_news";
				}
			}
			
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("atualizarPagina", atualizarPagina);
			request.setAttribute("paginaAtual", paginaAtual); 
			request.setAttribute("iconePaginaAtual", iconePaginaAtual);
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		
		
		
		@RequestMapping(value = "/contato", method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void contato(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			paginaAtual = "Contato";
			iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
			String link = "contato";
			String itemMenu = link;
			 //JSP que ir?? acessar.
			request.setAttribute("news", newsDao.findAll());
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
				
		
		@RequestMapping(value = "/imovel_{id}", method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void propriedade(HttpServletRequest request, HttpServletResponse response, @PathVariable (required = false) String id) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			paginaAtual = "Propriedade";
			iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
			String link = "propriedade";
			String itemMenu = link;
			 //JSP que ir?? acessar.
			System.out.println("ID: "+id);
			Imovel i = imovelDao.findById(Integer.parseInt(id)).get();
			
			List<TipoImovel> tipos = tipoImovelDao.buscarTudo();
			List<TipoPagamento> tipoPagamento = tipoPagamentoDao.buscarTudo();
			List<Seguranca> segurancaLista = segurancaDao.buscarTudo();
			List<Comodidade> comodidadeLista = comodidadeDao.buscarTudo();
			List<Lazer> lazerLista = lazerDao.buscarTudo();
			
			request.setAttribute("segurancaLista", segurancaLista);
			request.setAttribute("comodidadeLista", comodidadeLista);
			request.setAttribute("lazerLista", lazerLista);
			request.setAttribute("tipos", tipos);
			request.setAttribute("tipoPagamento", tipoPagamento);
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("imovel", i);
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void login(HttpServletRequest request, HttpServletResponse response, String login, String senha) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			paginaAtual = "Login";
			iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
			String link = "login";
			atualizarPagina = null;
			String itemMenu = link;
			Boolean valido = true;
			String incorreto = "";
			if(login != null && senha != null) {
				usuario = null;
				if(!login.equals(" ") && !senha.equals(" ") && login != null && senha != null) {
					Usuario u = usuarioDao.fazerLogin(login, senha);
					if(u != null) {
						usuario = u;
						logado = true;
						valido = true;
						atualizarPagina = "/";
						session.setAttribute("usuario",usuario);
						session.setAttribute("logado",logado);
					} else {
						usuario = null;
						incorreto = "Usu??rio/Senha incorreta.";
						usuario = null;
						logado = false;
						valido = false;
					}
				}	
			}
			 //JSP que ir?? acessar.
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("atualizarPagina", atualizarPagina);
			if(!valido) {
				request.setAttribute("incorreto", incorreto);
			} else {
				if(usuario.getId() != null)
					request.setAttribute("correto", "Bem vindo<br><br>" + usuario.getNome()+"!");
			}
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		
		@RequestMapping(value = {"/cadastrar_imoveis","/cadastrar_imoveis_{idPesq}"}, method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void cadastrar_imoveis(HttpServletRequest request, HttpServletResponse response, @PathVariable (required = false) String idPesq, String idAtualiza, String acao, String responsavel, String contatoResponsavel, String statusImovel, String tipoImovel, String categoria, String descricao, String bairro, String banheiros, String cep, String cidade, String estado, String condominio, String disponivel, String enderecoGoogleMap, String preco, String quartos, String rua, String salas, String tamanho, String vagas, String imagem1, String imagem2, String imagem3, String imagem4, String imagem5, String imagem6, String imagem7, String imagem8, String imobiliaria, String tipoPagamento, String lazer, String seguranca, String comodidade) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			String link = "deslogar";
			String itemMenu = link;
			if(logado && usuario != null) {
				paginaAtual = "Cadastrar";
				iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
				link = "cadastrar_imoveis";
				itemMenu = link;
				if(acao != null && (acao.equals("salvar") || acao.equals("atualizar"))) {
				// Salvando	
					Imovel imovel = new Imovel();
					if(acao.equals("atualizar") && idAtualiza != null) {
						imovel = imovelDao.findById(Integer.parseInt(idAtualiza)).get();
					}
					imovel.setResponsavel(responsavel);
					imovel.setContatoResponsavel(contatoResponsavel);
					imovel.setStatusImovel(statusImovelDao.findById(Integer.parseInt(statusImovel)).get());
					imovel.setTipoImovel(tipoImovelDao.findById(Integer.parseInt(tipoImovel)).get());
					imovel.setCategoria(categoriaDao.findById(Integer.parseInt(categoria)).get());
					imovel.setDescricao(descricao);
					imovel.setBairro(bairro);
					imovel.setBanheiros(Integer.parseInt(banheiros));
					imovel.setCep(cep);
					imovel.setCidade(cidade);
					imovel.setEstado(estado);
					if(condominio.equals("")) condominio="0";
					imovel.setCondominio(Double.parseDouble(condominio));
					imovel.setDisponivel(Boolean.parseBoolean(disponivel));
					imovel.setEnderecoGoogleMap(enderecoGoogleMap);
					imovel.setPreco(Double.parseDouble(preco));
					imovel.setQuartos(Integer.parseInt(quartos));
					imovel.setRua(rua);
					imovel.setSalas(Integer.parseInt(salas));
					imovel.setTamanho(Integer.parseInt(tamanho));
					imovel.setVagas(Integer.parseInt(vagas));
					if(!imagem1.equals("") && imagem1 != null) {
						imovel.setImagem1(imagem1);
					}
					if(!imagem2.equals("") && imagem2 != null) {
						imovel.setImagem2(imagem2);
					}
					if(!imagem3.equals("") && imagem3 != null) {
						imovel.setImagem3(imagem3);
					}
					if(!imagem4.equals("") && imagem4 != null) {
						imovel.setImagem4(imagem4);
					}
					if(!imagem5.equals("") && imagem5 != null) {
						imovel.setImagem1(imagem5);
					}
					if(!imagem6.equals("") && imagem6 != null) {
						imovel.setImagem2(imagem6);
					}
					if(!imagem7.equals("") && imagem7 != null) {
						imovel.setImagem3(imagem7);
					}
					if(!imagem8.equals("") && imagem8 != null) {
						imovel.setImagem4(imagem8);
					}
					//Tipo de Pagamento
					List<TipoPagamento> listaTipoPagamento = new ArrayList<TipoPagamento>();
					if(tipoPagamento !=  null) {
						if(!tipoPagamento.contains(",")) {
							TipoPagamento obj = tipoPagamentoDao.findById(Integer.parseInt(""+tipoPagamento)).get();
							listaTipoPagamento.add(obj);
						} else {
							String[] textoSeparado = tipoPagamento.split(",");
							for(int i = 0; i < textoSeparado.length; i++) {
								String id = ""+textoSeparado[i];
								System.out.println("TIPO PGTO ID: "+id);
								TipoPagamento obj = tipoPagamentoDao.findById(Integer.parseInt(""+id)).get();
								listaTipoPagamento.add(obj);
							}
						}
						imovel.setTipoPagamento(listaTipoPagamento);
					}
					//Lazer
					List<Lazer> listaLazer = new ArrayList<Lazer>();
					if(lazer !=  null) {
						if(!lazer.contains(",")) {
							Lazer obj = lazerDao.findById(Integer.parseInt(""+lazer)).get();
							listaLazer.add(obj);
						} else {
							String[] textoSeparado = lazer.split(",");
							for(int i = 0; i < textoSeparado.length; i++) {
								String id = ""+textoSeparado[i];
								System.out.println("LAZER ID: "+id);
								Lazer obj = lazerDao.findById(Integer.parseInt(""+id)).get();
								listaLazer.add(obj);
							}
						}
						imovel.setLazer(listaLazer);
					}
					//Seguran??a
					List<Seguranca> listaSeguranca = new ArrayList<Seguranca>();
					if(seguranca !=  null) {
						if(!seguranca.contains(",")) {
							Seguranca obj = segurancaDao.findById(Integer.parseInt(""+seguranca)).get();
							listaSeguranca.add(obj);
						} else {
							String[] textoSeparado = seguranca.split(",");
							for(int i = 0; i < textoSeparado.length; i++) {
								String id = ""+textoSeparado[i];
								System.out.println("SEGURANCA ID: "+id);
								Seguranca obj = segurancaDao.findById(Integer.parseInt(""+id)).get();
								listaSeguranca.add(obj);
							}
						}
						imovel.setSeguranca(listaSeguranca);
					}
					//Comodidades
					List<Comodidade> listaComodidade = new ArrayList<Comodidade>();
					if(comodidade !=  null) {
						if(!comodidade.contains(",")) {
							Comodidade obj = comodidadeDao.findById(Integer.parseInt(""+comodidade)).get();
							listaComodidade.add(obj);
						} else {
							String[] textoSeparado = comodidade.split(",");
							for(int i = 0; i < textoSeparado.length; i++) {
								String id = ""+textoSeparado[i];
								System.out.println("COMODIDADE ID: "+id);
								Comodidade obj = comodidadeDao.findById(Integer.parseInt(""+id)).get();
								listaComodidade.add(obj);
							}
						}
						imovel.setComodidade(listaComodidade);
					}
					imovelDao.save(imovel);
				}
			} else {
				link = "deslogar";
			}
			
			List<Usuario> usuarios = usuarioDao.findAll();
			List<ObjetoCidadeEstado> cidades = new ArrayList<ObjetoCidadeEstado>();
			List<String> c = imovelDao.buscarRegioes();
			if(c != null) {
				for(String texto : c) {
					if(texto !=  null) {
						String[] textoSeparado = texto.split("#");
						ObjetoCidadeEstado o = new ObjetoCidadeEstado();
						o.setCidade(textoSeparado[0]);
						o.setEstado(textoSeparado[1]);
						cidades.add(o);
					}
				}
			}
			
			
			
			
			 //JSP que ir?? acessar.
			List<Imovel> imoveis = imovelDao.buscarTudo();
			if(idPesq != null) {
				request.getRequestDispatcher("/WEB-INF/jsp/pesquisar_imoveis.jsp").forward(request, response);
				Imovel i = imovelDao.findById(Integer.parseInt(idPesq)).get();
				request.setAttribute("imoveis", i);
				request.setAttribute("idPesq", idPesq);
			} else {
				request.setAttribute("imoveis", imoveis);
			}
			
			request.setAttribute("usuarios", usuarios);
			request.setAttribute("imobiliarias", imobiliariaDao.buscarTudo());
			request.setAttribute("statusImovel", statusImovelDao.buscarTudo());
			request.setAttribute("categorias", categoriaDao.buscarTudo());
			request.setAttribute("tipoPagamento", tipoPagamentoDao.buscarTudo());
			request.setAttribute("tipoImovel", tipoImovelDao.buscarTudo());
			request.setAttribute("comodidades", comodidadeDao.buscarTudo());
			request.setAttribute("lazer", lazerDao.buscarTudo());
			request.setAttribute("seguranca", segurancaDao.buscarTudo());
			request.setAttribute("cidades", cidades);
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		@RequestMapping(value = {"/cadastrar_usuarios","/cadastrar_usuarios_{idPesq}"}, method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void cadastrar_usuarios(HttpServletRequest request, HttpServletResponse response, @PathVariable (required = false) String idPesq, String idAtualiza,  String acao, Usuario usuario_submit) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Boolean logado = false;
			//Usuario usuario = new Usuario();
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			String link = "deslogar";
			 //JSP que ir?? acessar.
			if(logado) {
				paginaAtual = "cadastrar_usuarios";
				iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
				link = "cadastrar_usuarios";
				 //JSP que ir?? acessar.
				//Caso esteja logado.
				if(acao != null && (acao.equals("salvar") || idAtualiza != null)) {
					Usuario u = new Usuario();
					if(idAtualiza != null && !idAtualiza.equals("")) {
						u = usuarioDao.findById(Integer.parseInt(idAtualiza)).get();
					}
					u.setAtivo(usuario_submit.getAtivo());
					u.setGravacao(usuario_submit.getGravacao());
					u.setLeitura(usuario_submit.getLeitura());
					u.setLogin(usuario_submit.getLogin());
					u.setNome(usuario_submit.getNome());
					u.setSenha(usuario_submit.getSenha());
					usuarioDao.save(u);
				}
				if(idPesq != null) {
					Usuario u = usuarioDao.findById(Integer.parseInt(idPesq)).get();
					request.setAttribute("u", u);
				}
				List<Usuario> usuarios = usuarioDao.findAll();
				request.setAttribute("usuarios", usuarios);
			}
			request.setAttribute("usuario", usuario_submit);
			request.setAttribute("paginaAtual", paginaAtual); 
			request.setAttribute("iconePaginaAtual", iconePaginaAtual);
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		
		
		@RequestMapping(value = {"/cadastrar_imobiliarias","/cadastrar_imobiliarias_{idPesq}"}, method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void cadastrar_imobiliarias(HttpServletRequest request, HttpServletResponse response, @PathVariable (required = false) String idPesq, String idAtualiza,  String acao, Imobiliaria imobiliaria) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			String link = "deslogar";
			 //JSP que ir?? acessar.
			if(logado) {
				paginaAtual = "cadastrar_imobiliarias";
				iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
				link = "cadastrar_imobiliarias";
				String itemMenu = link;
				 //JSP que ir?? acessar.
				//Caso esteja logado.
				if(acao != null && (acao.equals("salvar") || idAtualiza != null)) {
					Imobiliaria u = new Imobiliaria();
					if(idAtualiza != null && !idAtualiza.equals("")) {
						u = imobiliariaDao.findById(Integer.parseInt(idAtualiza)).get();
					}
					u.setAtivo(imobiliaria.getAtivo());
					u.setCnpj(imobiliaria.getCnpj());
					u.setCodigo(imobiliaria.getCodigo());
					u.setContato(imobiliaria.getDescricao());
					u.setDescricao(imobiliaria.getDescricao());
					u.setNome(imobiliaria.getNome());
					u.setResponsavel(imobiliaria.getResponsavel());
					imobiliariaDao.save(u);
				}
				if(idPesq != null) {
					Imobiliaria u = imobiliariaDao.findById(Integer.parseInt(idPesq)).get();
					request.setAttribute("u", u);
				}
				List<Imobiliaria> imobiliarias = imobiliariaDao.findAll();
				request.setAttribute("imobiliarias", imobiliarias);
			}
			
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("paginaAtual", paginaAtual); 
			request.setAttribute("iconePaginaAtual", iconePaginaAtual);
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		
		
		@RequestMapping(value = {"/cadastrar_especificacoes"}, method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void cadastrar_especificacoes(HttpServletRequest request, HttpServletResponse response, String acao, String tipo, String nome, String descricao) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			String link = "deslogar";
			 //JSP que ir?? acessar.
			if(logado) {
				link = "cadastrar_especificacoes";
				paginaAtual = "cadastrar_especificacoes";
				iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
				 //JSP que ir?? acessar.
				//Caso esteja logado.
				if(acao != null && (acao.equals("salvar"))) {
					if(tipo.equals("Comodidade")) {
						Comodidade ob = new Comodidade();
						ob.setAtivo(true);
						ob.setDescricao(descricao);
						ob.setNome(nome);
						comodidadeDao.save(ob);
					}
					if(tipo.equals("Lazer")) {
						Lazer ob = new Lazer();
						ob.setAtivo(true);
						ob.setDescricao(descricao);
						ob.setNome(nome);
						lazerDao.save(ob);
					}
					if(tipo.equals("Seguran??a")) {
						Seguranca ob = new Seguranca();
						ob.setAtivo(true);
						ob.setDescricao(descricao);
						ob.setNome(nome);
						segurancaDao.save(ob);
					}
				}
				request.setAttribute("lazer", lazerDao.buscarTudo());
				request.setAttribute("comodidade", comodidadeDao.buscarTudo());
				request.setAttribute("seguranca", segurancaDao.buscarTudo());
			}
			
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("paginaAtual", paginaAtual); 
			request.setAttribute("iconePaginaAtual", iconePaginaAtual);
			request.setAttribute("news", newsDao.findAll());
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		
		
		@RequestMapping(value = {"/cadastrar_news"}, method = {RequestMethod.GET, RequestMethod.POST}) // Pagina de Altera????o de Perfil
		public void cadastrar_news(HttpServletRequest request, HttpServletResponse response, String acao, String descricao) throws ServletException, IOException { //Fun????o e alguns valores que recebe...
			HttpSession session = request.getSession();
			String atualizarPagina = "";
			String paginaAtual = "";
			String iconePaginaAtual = "";
			Usuario usuario = new Usuario();
			Boolean logado = false;
			if(session.getAttribute("usuario") != null) {
				usuario = (Usuario) session.getAttribute("usuario");
			}
			if(session.getAttribute("logado") != null) {
				logado = (Boolean) session.getAttribute("logado");
			}
			String link = "deslogar";
			 //JSP que ir?? acessar.
			if(logado) {
				paginaAtual = "cadastrar_news";
				iconePaginaAtual = "fa fa-user"; //Titulo do menuzinho.
				link = "cadastrar_news";
				String itemMenu = link;
				 //JSP que ir?? acessar.
				//Caso esteja logado.
				if(acao != null && (acao.equals("salvar"))) {
						System.out.println("Salvar"+acao);
						News ob = new News();
						ob.setDescricao(descricao);
						newsDao.save(ob);
						request.setAttribute("n", ob);
				}
				request.setAttribute("news", newsDao.buscarTudo());
			}
			
			if(session.getAttribute("usuario") != null) {
				request.setAttribute("usuario", usuario);
			}
			request.setAttribute("paginaAtual", paginaAtual); 
			request.setAttribute("iconePaginaAtual", iconePaginaAtual);
			request.getRequestDispatcher("/WEB-INF/jsp/"+link+".jsp").forward(request, response); 
		}
		
		
		
}
	
	
	




