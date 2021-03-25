package model;

public class Veiculo {
	
	private int idVeiculo;
	private String fabricante;
	private String modelo;
	private String tipo;
	private String placa;
	private String cor;
	private String ano;
	private String numeroChassi;
	private boolean ativo;
	
	public Veiculo() {
		super();
	}
	
	public Veiculo(int idVeiculo, String fabricante, String modelo, String tipo, String placa, String cor,
			String ano, String numeroChassi) {
		super();
		this.idVeiculo = idVeiculo;
		this.fabricante = fabricante;
		this.modelo = modelo;
		this.tipo = tipo;
		this.placa = placa;
		this.cor = cor;
		this.ano = ano;
		this.numeroChassi = numeroChassi;
	}
	
	public Veiculo(String fabricante, String modelo, String tipo, String placa, String cor,
			String ano, String numeroChassi) {
		super();
		this.fabricante = fabricante;
		this.modelo = modelo;
		this.tipo = tipo;
		this.placa = placa;
		this.cor = cor;
		this.ano = ano;
		this.numeroChassi = numeroChassi;
	}
	
	public Veiculo(int idVeiculo) {
		super();
		this.idVeiculo = idVeiculo;
	}
	
	public Veiculo(int idVeiculo, String modelo) {
		super();
		this.idVeiculo = idVeiculo;
		this.modelo = modelo;
	}
	
	public int getIdVeiculo() {
		return idVeiculo;
	}
	public void setIdVeiculo(int idVeiculo) {
		this.idVeiculo = idVeiculo;
	}
	public String getFabricante() {
		return fabricante;
	}
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getNumeroChassi() {
		return numeroChassi;
	}
	public void setNumeroChassi(String numeroChassi) {
		this.numeroChassi = numeroChassi;
	}
	public boolean isAtivo() {
		return ativo;
	}
	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}
	
}

