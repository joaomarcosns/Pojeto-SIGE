package model;

public class Remetente extends Pessoa {
	
	private int idRemetente;

	public Remetente() {
		super();
	}
	
	public Remetente(int idRemetente) {
		super();
		this.idRemetente = idRemetente;
	}

	public Remetente(String nomeCompleto, String cpf, String email, String telefone, Endereco endereco) {
		super(nomeCompleto, cpf, email, telefone, endereco);
	}
	public Remetente(int idRemetente, String nomeCompleto, String cpf, String email, String telefone, Endereco endereco) {
		super(nomeCompleto, cpf, email, telefone, endereco);
		this.idRemetente = idRemetente;
	}

	public Remetente(String nomeCompleto) {
		super(nomeCompleto);
	}

	public Remetente(Endereco endereco) {
		super(endereco);
	}

	public int getIdRemetente() {
		return idRemetente;
	}
	public void setIdRemetente(int idRemetente) {
		this.idRemetente = idRemetente;
	}

}

