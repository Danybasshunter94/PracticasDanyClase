package modelo;

public class Contador {

	private int contador;

	@Override
	public String toString() {
		return "Contador: " + contador;
	}

	public Contador() {
		super();
		// TODO Auto-generated constructor stub
		contador = 0;
	
	}
	
	public Contador(int contador) {
		super();
		this.contador = contador;
	}

	public int getContador() {
		return contador;
	}

	public void setContador(int contador) {
		this.contador = contador;
	}

	public void incrementarContador() {
		contador++;
	}
	
	
}
