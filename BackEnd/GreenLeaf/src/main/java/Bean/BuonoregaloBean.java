package Bean;

public class BuonoregaloBean {

    public String idBuonoregalo, stato, url, utenteRegalo;
    public Double prezzo;
    public Integer ordineRegalo;

    public BuonoregaloBean(String idBuonoregalo, String stato, String url, String utenteRegalo, Double prezzo, Integer ordineRegalo) {
        this.idBuonoregalo = idBuonoregalo;
        this.stato = stato;
        this.url = url;
        this.utenteRegalo = utenteRegalo;
        this.prezzo = prezzo;
        this.ordineRegalo = ordineRegalo;
    }

    public String getIdBuonoregalo() {
        return idBuonoregalo;
    }

    public void setIdBuonoregalo(String idBuonoregalo) {
        this.idBuonoregalo = idBuonoregalo;
    }

    public String getStato() {
        return stato;
    }

    public void setStato(String stato) {
        this.stato = stato;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUtenteRegalo() {
        return utenteRegalo;
    }

    public void setUtenteRegalo(String utenteRegalo) {
        this.utenteRegalo = utenteRegalo;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Double prezzo) {
        this.prezzo = prezzo;
    }

    public Integer getOrdineRegalo() {
        return ordineRegalo;
    }

    public void setOrdineRegalo(Integer ordineRegalo) {
        this.ordineRegalo = ordineRegalo;
    }

    @Override
    public String toString() {
        return "BuonoregaloBean{" +
                "idBuonoregalo='" + idBuonoregalo + '\'' +
                ", stato='" + stato + '\'' +
                ", url='" + url + '\'' +
                ", utenteRegalo='" + utenteRegalo + '\'' +
                ", prezzo=" + prezzo +
                ", ordineRegalo=" + ordineRegalo +
                '}';
    }
}
