package Modelo;

public class Color {

    private String tipo;
    private String especificacion;
    private String valor;

    //Constructor
    public Color(String tipo, String especificacion, String valor) {
        this.tipo = tipo;
        this.especificacion = especificacion;
        this.valor = valor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEspecificacion() {
        return especificacion;
    }

    public void setEspecificacion(String especificacion) {
        this.especificacion = especificacion;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

}
