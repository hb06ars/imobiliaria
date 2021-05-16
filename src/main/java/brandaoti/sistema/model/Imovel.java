package brandaoti.sistema.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Imovel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; //Esse número é o ID automático gerado.
	
	@Column
	private Boolean ativo = true;
	
	@Column
	private Boolean disponivel = true;
	
	@Column
	private Integer quartos = 0;
	@Column
	private Integer banheiros = 0;
	@Column
	private Integer vagas = 0;
	@Column
	private Integer tamanho = 0;
	@Column
	private Integer salas = 0;
	
	@ManyToMany
	private List<TipoPagamento> tipoPagamento; //Alugar / Comprar
	
	@OneToOne
	private Categoria categoria; //Residencial / Comercial
	
	@OneToOne
	private TipoImovel tipoImovel; //Apartamento / Casa / Condominio
	
	@OneToOne
	private StatusImovel statusImovel; //Pronto pra morar, na planta, Em construcao
	
	@ManyToMany
	private List<Seguranca> seguranca; // interfone, seguranca 24hs, vigia
	
	@ManyToMany
	private List<Comodidade> comodidade; // elevador, ar condicionado, academia
	
	@ManyToMany
	private List<Lazer> lazer; // piscina, quadra, cinema
	
	
	@ManyToMany
	private List<Imobiliaria> imobiliaria; 
	
	@Column
	private String responsavel;
	
	@Column
	private String contatoResponsavel;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String descricao;
	
	@Column
	private String rua;
	
	@Column
	private String bairro;
	
	@Column
	private String cidade;
	
	@Column
	private String estado;
	
	@Column
	private String cep;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String enderecoGoogleMap;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem1;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem2;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem3;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem4;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem5;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem6;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem7;
	
	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String imagem8;
	
	@Column
	private Double preco = 0.0;
	
	@Column
	private Double condominio = 0.0;
	
	@Column
	private Date dataCadastro = new Date();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public Boolean getDisponivel() {
		return disponivel;
	}

	public void setDisponivel(Boolean disponivel) {
		this.disponivel = disponivel;
	}

	public List<TipoPagamento> getTipoPagamento() {
		return tipoPagamento;
	}

	public void setTipoPagamento(List<TipoPagamento> tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public TipoImovel getTipoImovel() {
		return tipoImovel;
	}

	public void setTipoImovel(TipoImovel tipoImovel) {
		this.tipoImovel = tipoImovel;
	}

	public StatusImovel getStatusImovel() {
		return statusImovel;
	}

	public void setStatusImovel(StatusImovel statusImovel) {
		this.statusImovel = statusImovel;
	}

	
	public List<Seguranca> getSeguranca() {
		return seguranca;
	}

	public void setSeguranca(List<Seguranca> seguranca) {
		this.seguranca = seguranca;
	}

	public List<Comodidade> getComodidade() {
		return comodidade;
	}

	public void setComodidade(List<Comodidade> comodidade) {
		this.comodidade = comodidade;
	}

	public List<Lazer> getLazer() {
		return lazer;
	}

	public void setLazer(List<Lazer> lazer) {
		this.lazer = lazer;
	}

	public List<Imobiliaria> getImobiliaria() {
		return imobiliaria;
	}

	public void setImobiliaria(List<Imobiliaria> imobiliaria) {
		this.imobiliaria = imobiliaria;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public String getContatoResponsavel() {
		return contatoResponsavel;
	}

	public void setContatoResponsavel(String contatoResponsavel) {
		this.contatoResponsavel = contatoResponsavel;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getImagem1() {
		return imagem1;
	}

	public void setImagem1(String imagem1) {
		this.imagem1 = imagem1;
	}

	public String getImagem2() {
		return imagem2;
	}

	public void setImagem2(String imagem2) {
		this.imagem2 = imagem2;
	}

	public String getImagem3() {
		return imagem3;
	}

	public void setImagem3(String imagem3) {
		this.imagem3 = imagem3;
	}

	public String getImagem4() {
		return imagem4;
	}

	public void setImagem4(String imagem4) {
		this.imagem4 = imagem4;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Double getCondominio() {
		return condominio;
	}

	public void setCondominio(Double condominio) {
		this.condominio = condominio;
	}


	public Date getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}

	public String getEnderecoGoogleMap() {
		return enderecoGoogleMap;
	}

	public void setEnderecoGoogleMap(String enderecoGoogleMap) {
		this.enderecoGoogleMap = enderecoGoogleMap;
	}

	public Integer getQuartos() {
		return quartos;
	}

	public void setQuartos(Integer quartos) {
		this.quartos = quartos;
	}

	public Integer getBanheiros() {
		return banheiros;
	}

	public void setBanheiros(Integer banheiros) {
		this.banheiros = banheiros;
	}

	public Integer getVagas() {
		return vagas;
	}

	public void setVagas(Integer vagas) {
		this.vagas = vagas;
	}

	public Integer getTamanho() {
		return tamanho;
	}

	public void setTamanho(Integer tamanho) {
		this.tamanho = tamanho;
	}

	public Integer getSalas() {
		return salas;
	}

	public void setSalas(Integer salas) {
		this.salas = salas;
	}

	public String getImagem5() {
		return imagem5;
	}

	public void setImagem5(String imagem5) {
		this.imagem5 = imagem5;
	}

	public String getImagem6() {
		return imagem6;
	}

	public void setImagem6(String imagem6) {
		this.imagem6 = imagem6;
	}

	public String getImagem7() {
		return imagem7;
	}

	public void setImagem7(String imagem7) {
		this.imagem7 = imagem7;
	}

	public String getImagem8() {
		return imagem8;
	}

	public void setImagem8(String imagem8) {
		this.imagem8 = imagem8;
	}

	
	
	
		
	
	
}
