package com.productos.negocio;

public class Auditoria {
    private int idAud;
    private String tablaAud;
    private String operacionAud;
    private String valorAnterior;
    private String valorNuevo;
    private String fecha;
    private String usuario;

    public int getIdAud() { return idAud; }
    public void setIdAud(int idAud) { this.idAud = idAud; }

    public String getTablaAud() { return tablaAud; }
    public void setTablaAud(String tablaAud) { this.tablaAud = tablaAud; }

    public String getOperacionAud() { return operacionAud; }
    public void setOperacionAud(String operacionAud) { this.operacionAud = operacionAud; }

    public String getValorAnterior() { return valorAnterior; }
    public void setValorAnterior(String valorAnterior) { this.valorAnterior = valorAnterior; }

    public String getValorNuevo() { return valorNuevo; }
    public void setValorNuevo(String valorNuevo) { this.valorNuevo = valorNuevo; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }

    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }
}
