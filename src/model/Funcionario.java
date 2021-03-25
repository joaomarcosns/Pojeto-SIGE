package model;

import java.sql.Date;

public class Funcionario extends Pessoa {
	
	private int idFuncionario;
	private double salario;
	private String cargo;
	private String carteiraTrabalho;
	private Date dataCadastro;
	private boolean ativo;
	
	public Funcionario() {
		super();
	}

	public Funcionario(String nomeCompleto, String cpf, String email, String telefone, double salario, String cargo,
			String carteiraTrabalho, Date dataCadastro, Endereco endereco) {
		super(nomeCompleto, cpf, email, telefone, endereco);
		this.salario = salario;
		this.cargo = cargo;
		this.carteiraTrabalho = carteiraTrabalho;
		this.dataCadastro = dataCadastro;
	}
	
	public Funcionario(int idFuncionario, String nomeCompleto, String cpf, String email, String telefone, double salario,
			String cargo, String carteiraTrabalho, Date dataCadastro, Endereco endereco) {
		super(nomeCompleto, cpf, email, telefone, endereco);
		this.idFuncionario = idFuncionario;
		this.salario = salario;
		this.cargo = cargo;
		this.carteiraTrabalho = carteiraTrabalho;
		this.dataCadastro = dataCadastro;
	}

	public Funcionario(int idFuncionario, String nomeCompleto) {
		super(nomeCompleto);
		this.idFuncionario = idFuncionario;
	}
	
	public Funcionario(String nomeCompleto) {
		super(nomeCompleto);
	}
	
	public Funcionario(int idFuncionario) {
		super();
		this.idFuncionario = idFuncionario;
	}

	public int getIdFuncionario() {
		return idFuncionario;
	}
	public void setIdFuncionario(int idFuncionario) {
		this.idFuncionario = idFuncionario;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	public String getCarteiraTrabalho() {
		return carteiraTrabalho;
	}
	public void setCarteiraTrabalho(String carteiraTrabalho) {
		this.carteiraTrabalho = carteiraTrabalho;
	}
	public Date getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Date datacadastro) {
		this.dataCadastro = datacadastro;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

	@Override
	public void dataDeCadastro() {
		long dataAtual = System.currentTimeMillis();
		Date date = new Date(dataAtual);
		this.setDataCadastro(date);
	}

}

