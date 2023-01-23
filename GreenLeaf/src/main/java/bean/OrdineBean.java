package bean;

import java.sql.Date;

public class OrdineBean {

    public Integer idOrdine;
    public Date data;
    public Double totale;
    public String utenteOrdine;

    public OrdineBean() {
    }

    public OrdineBean(Integer idOrdine, Date data, Double totale, String utenteOrdine) {
        this.idOrdine = idOrdine;
        this.data = data;
        this.totale = totale;
        this.utenteOrdine = utenteOrdine;
    }

    public Integer getIdOrdine() {
        return idOrdine;
    }

    public void setIdOrdine(Integer idOrdine) {
        this.idOrdine = idOrdine;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Double getTotale() {
        return totale;
    }

    public void setTotale(Double totale) {
        this.totale = totale;
    }

    public String getUtenteOrdine() {
        return utenteOrdine;
    }

    public void setUtenteOrdine(String utenteOrdine) {
        this.utenteOrdine = utenteOrdine;
    }

    @Override
    public String toString() {
        return "OrdineBean{" +
                "idOrdine=" + idOrdine +
                ", data=" + data +
                ", totale=" + totale +
                ", utenteOrdine='" + utenteOrdine + '\'' +
                '}';
    }
}
