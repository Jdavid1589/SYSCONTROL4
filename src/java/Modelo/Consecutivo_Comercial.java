package Modelo;

public class Consecutivo_Comercial {

    private int idConsecutivo_Comercial;
    private int idEspecificaciones;
    private String nroRemision;
    private String fechaCertificado;
    private String fechaProduccion;
    private int cantidadMaterial;
    private int idUsuarios;
    private String lote;

    public int getIdConsecutivo_Comercial() {
        return idConsecutivo_Comercial;
    }

    public void setIdConsecutivo_Comercial(int idConsecutivo_Comercial) {
        this.idConsecutivo_Comercial = idConsecutivo_Comercial;
    }

    public int getIdEspecificaciones() {
        return idEspecificaciones;
    }

    public void setIdEspecificaciones(int idEspecificaciones) {
        this.idEspecificaciones = idEspecificaciones;
    }

    public String getNroRemision() {
        return nroRemision;
    }

    public void setNroRemision(String nroRemision) {
        this.nroRemision = nroRemision;
    }

    public String getFechaCertificado() {
        return fechaCertificado;
    }

    public void setFechaCertificado(String fechaCertificado) {
        this.fechaCertificado = fechaCertificado;
    }

    public String getFechaProduccion() {
        return fechaProduccion;
    }

    public void setFechaProduccion(String fechaProduccion) {
        this.fechaProduccion = fechaProduccion;
    }

    public int getCantidadMaterial() {
        return cantidadMaterial;
    }

    public void setCantidadMaterial(int cantidadMaterial) {
        this.cantidadMaterial = cantidadMaterial;
    }

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

}
