package brandaoti.sistema.model;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id; //Esse número é o ID automático gerado.
	
	@Column
	private String login;
	
	@Column
	private String senha = "123";
	
	@Column
	private Boolean ativo = true;
	
	@Column
	private String nome;
	
	@Column
	private Boolean gravacao = false;
	
	@Column
	private Boolean leitura = true;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Boolean getAtivo() {
		return ativo;
	}

	public void setAtivo(Boolean ativo) {
		this.ativo = ativo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Boolean getGravacao() {
		return gravacao;
	}

	public void setGravacao(Boolean gravacao) {
		this.gravacao = gravacao;
	}

	public Boolean getLeitura() {
		return leitura;
	}

	public void setLeitura(Boolean leitura) {
		this.leitura = leitura;
	}
	
	
	
}
