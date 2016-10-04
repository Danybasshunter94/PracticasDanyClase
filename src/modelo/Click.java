package modelo;

import java.util.Date;

public class Click {
	
	private Contador contador;
	private Date fechaHora;
	
	public Click() {
		// TODO Auto-generated constructor stub
		
	}

	public Click(Contador contador) {
		super();
		this.contador = contador;
		this.fechaHora = new Date();
	}

	public Contador getContador() {
		return contador;
	}

	public void setContador(Contador contador) {
		this.contador = contador;
	}

	public Date getFechaHora() {
		return fechaHora;
	}

	public void setFechaHora(Date fechaHora) {
		this.fechaHora = fechaHora;
	}

	

}
