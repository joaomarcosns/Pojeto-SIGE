package model;

public class Pessoa {
	
	private String nomeCompleto;
	private String cpf;
	private String email;
	private String telefone;
	private Endereco endereco;
	
	public Pessoa() {
		super();
	}
	
	public Pessoa(String nomeCompleto, String cpf, String email, String telefone, Endereco endereco) {
		super();
		this.nomeCompleto = nomeCompleto;
		this.cpf = cpf;
		this.email = email;
		this.telefone = telefone;
		this.endereco = endereco;
	}

	public Pessoa(String nomeCompleto) {
        super();
        this.nomeCompleto = nomeCompleto;
    }
	
	public Pessoa(Endereco endereco) {
		super();
		this.endereco = endereco;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	
	public void dataDeCadastro() {
		// método para polimorfismo	
	}


}

