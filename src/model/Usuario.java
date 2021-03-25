package model;

public class Usuario {
	
	private int idUser;
	private String nome;
	private String senha;
	private String email;
	private int nivelConta;
	private boolean online;
	
	public Usuario() {
		super();
	}
	
	public Usuario(int idUser, String nome, String senha, String email, int nivelConta, boolean online) {
		this.idUser = idUser;
		this.nome = nome;
		this.senha = senha;
		this.email = email;
		this.nivelConta = nivelConta;
		this.online = online;
	}
	
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNivelConta() {
		return nivelConta;
	}
	public void setNivelConta(int nivelConta) {
		this.nivelConta = nivelConta;
	}
	public boolean isOnline() {
		return online;
	}
	public void setOnline(boolean online) {
		this.online = online;
	}

}
