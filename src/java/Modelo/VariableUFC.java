/*

 */
package Modelo;

public class VariableUFC {

    private String tipo;
    private String rango;
    private String metodo;

    //Constructor
    public VariableUFC(String tipo, String rango, String metodo) {
        this.tipo = tipo;
        this.rango = rango;
        this.metodo = metodo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getRango() {
        return rango;
    }

    public void setRango(String rango) {
        this.rango = rango;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

}
