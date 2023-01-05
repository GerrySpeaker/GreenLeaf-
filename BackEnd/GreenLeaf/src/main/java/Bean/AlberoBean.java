package Bean;

import java.util.Date;

public class AlberoBean {

    public Integer idAlbero, ordine;
    public String  co2, categoria, stato, utenteAlbero, utente;
    public Date dataPiantumazione;


    public AlberoBean(Integer idAlbero, Integer ordine, String co2, String categoria, String stato, String utenteAlbero, String utente, Date dataPiantumazione) {
        this.idAlbero = idAlbero;
        this.ordine = ordine;
        this.co2 = co2;
        this.categoria = categoria;
        this.stato = stato;
        this.utenteAlbero = utenteAlbero;
        this.utente = utente;
        this.dataPiantumazione = dataPiantumazione;
    }


    public Integer getIdAlbero() {
        return idAlbero;
    }

    public void setIdAlbero(Integer idAlbero) {
        this.idAlbero = idAlbero;
    }

    public Integer getOrdine() {
        return ordine;
    }

    public void setOrdine(Integer ordine) {
        this.ordine = ordine;
    }

    public String getCo2() {
        return co2;
    }

    public void setCo2(String co2) {
        this.co2 = co2;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getStato() {
        return stato;
    }

    public void setStato(String stato) {
        this.stato = stato;
    }

    public String getUtenteAlbero() {
        return utenteAlbero;
    }

    public void setUtenteAlbero(String utenteAlbero) {
        this.utenteAlbero = utenteAlbero;
    }

    public String getUtente() {
        return utente;
    }

    public void setUtente(String utente) {
        this.utente = utente;
    }

    public Date getDataPiantumazione() {
        return dataPiantumazione;
    }

    public void setDataPiantumazione(Date dataPiantumazione) {
        this.dataPiantumazione = dataPiantumazione;
    }


    @Override
    public String toString() {
        return "AlberoBean{" +
                "idAlbero=" + idAlbero +
                ", ordine=" + ordine +
                ", co2='" + co2 + '\'' +
                ", categoria='" + categoria + '\'' +
                ", stato='" + stato + '\'' +
                ", utenteAlbero='" + utenteAlbero + '\'' +
                ", utente='" + utente + '\'' +
                ", dataPiantumazione=" + dataPiantumazione +
                '}';
    }
}
