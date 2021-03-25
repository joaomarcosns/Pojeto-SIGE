package model;

public class Destinatario extends Pessoa {
	
	private int idDestinatario;
	
	public Destinatario() {
		super();
	}

	public Destinatario(int idDestinatario) {
		super();
		this.idDestinatario = idDestinatario;
	}

	public Destinatario(String nomeCompleto, String cpf, String email, String telefone, Endereco endereco) {
		super(nomeCompleto, cpf, email, telefone, endereco);
	}
	
	public Destinatario(int idDestinatario, String nomeCompleto, String cpf, String email, String telefone, Endereco endereco) {
		super(nomeCompleto, cpf, email, telefone, endereco);
		this.idDestinatario = idDestinatario;
	}

	public Destinatario(String nomeCompleto) {
		super(nomeCompleto);
	}

	public Destinatario(Endereco endereco) {
		super(endereco);
	}

	public int getIdDestinatario() {
		return idDestinatario;
	}
	public void setIdDestinatario(Integer idDestinatario) {
		this.idDestinatario = idDestinatario;
	}
	public void setIdDestinatario(int idDestinatario) {
		this.idDestinatario = idDestinatario;
	}
	
}


