package model;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class Encomenda {
	
	private int idEncomenda;
	private double valor;
	private double peso;
	private double altura;
	private double largura;
	private double comprimento;
	private String tipo;
	private Date dataPostagem;
	private Date dataPrevisao;
	private Time horas;
	private String observacoes;
	private String status;
	private Remetente remetente;
	private Destinatario destinatario;
	private Veiculo veiculo;
	private Funcionario funcionario;
	
	public Encomenda() {
		super();
	}

	public Encomenda(int idEncomenda, Remetente remetente, Destinatario destinatario, Veiculo veiculo, Funcionario funcionario, String tipo, double valor, double peso, double altura, double largura,
			double comprimento, String observacoes, String status, Date dataPostagem, Date dataPrevisao, Time horas) {
		this.idEncomenda = idEncomenda;
		this.tipo = tipo;
		this.valor = valor;
		this.peso = peso;
		this.altura = altura;
		this.largura = largura;
		this.comprimento = comprimento;
		this.remetente = remetente;
		this.destinatario = destinatario;
		this.veiculo = veiculo;
		this.funcionario = funcionario;
		this.observacoes = observacoes;
		this.status = status;
		this.dataPostagem = dataPostagem;
		this.horas = horas;
		this.dataPrevisao = dataPrevisao;
	}
	
	public Encomenda(int idEncomenda, Remetente remetente, Destinatario destinatario, Date dataPostagem, Date dataPrevisao, String status) {
		this.idEncomenda = idEncomenda;
		this.remetente = remetente;
		this.destinatario = destinatario;
		this.dataPostagem = dataPostagem;
		this.dataPrevisao = dataPrevisao;
		this.status = status;
	}
	
	public Encomenda(int idEncomenda,Remetente remetente, Destinatario destinatario, String tipo, Date dataPost, Date dataPrevisao, Time horaPost,
			double valor, double comprimento, double altura, double largura, double peso, 
			String status, String observacoes, Veiculo veiculo, Funcionario funcionario) {
		this.idEncomenda = idEncomenda;
		this.remetente = remetente;
		this.destinatario = destinatario;
		this.tipo = tipo;
		this.dataPostagem = dataPost;
		this.dataPrevisao = dataPrevisao;
		this.horas = horaPost;
		this.valor = valor;
		this.comprimento = comprimento;
		this.altura = altura;
		this.largura = largura;
		this.peso = peso;
		this.veiculo = veiculo;
		this.funcionario = funcionario;
		this.observacoes = observacoes;
		this.status = status;
	}

	public Encomenda(Remetente remetente, Destinatario destinatario, String tipo, Date dataPost, Time horaPost,
			double valor, double comprimento, double altura, double largura, double peso, Veiculo veiculo, Funcionario funcionario) {
		this.remetente = remetente;
		this.destinatario = destinatario;
		this.tipo = tipo;
		this.dataPostagem = dataPost;
		this.horas = horaPost;
		this.valor = valor;
		this.comprimento = comprimento;
		this.altura = altura;
		this.largura = largura;
		this.peso = peso;
		this.veiculo = veiculo;
		this.funcionario = funcionario;
	}

	public Time getHoras() {
		return horas;
	}
	public void setHoras(Time horas) {
		this.horas = horas;
	}
	public int getIdEncomenda() {
		return idEncomenda;
	}
	public void setIdEncomenda(int idEncomenda) {
		this.idEncomenda = idEncomenda;
	}
	public double getPeso() {
		return peso;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	public double getAltura() {
		return altura;
	}
	public void setAltura(double altura) {
		this.altura = altura;
	}
	public double getLargura() {
		return largura;
	}
	public void setLargura(double largura) {
		this.largura = largura;
	}
	public Remetente getRemetente() {
		return remetente;
	}
	public void setRemetente(Remetente remetente) {
		this.remetente = remetente;
	}
	public Destinatario getDestinatario() {
		return destinatario;
	}
	public void setDestinatario(Destinatario destinatario) {
		this.destinatario = destinatario;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	public double getComprimento() {
		return comprimento;
	}
	public void setComprimento(double comprimento) {
		this.comprimento = comprimento;
	}
	public String getObservacoes() {
		return observacoes;
	}
	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}
	public Veiculo getVeiculo() {
		return veiculo;
	}
	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}
	public Date getDataPostagem() {
		return dataPostagem;
	}
	public void setDataPostagem(Date dataPostagem) {
		this.dataPostagem = dataPostagem;
	}
	public Date getDataPrevisao() {
		return dataPrevisao;
	}
	public void setDataPrevisao(Date dataPrevisao) {
		this.dataPrevisao = dataPrevisao;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Funcionario getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(Funcionario funcionario) {
		this.funcionario = funcionario;
	}
	
	public void add15Dias(String data) {
        DateTimeFormatter formatador = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dataDigitada = LocalDate.parse(data, formatador);
        LocalDate dataSomada = dataDigitada.plus(Period.ofDays(15));
        Date date = Date.valueOf(dataSomada);
        this.setDataPrevisao(date);
    }

}

