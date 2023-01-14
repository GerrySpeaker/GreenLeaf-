package bean;

import java.util.Comparator;

public class CategoriaBean {

    public String nomeCategoria, co2Max, descrizione, url;
    public Double prezzo;

    public CategoriaBean() {
    }

    public CategoriaBean(String nomeCategoria, String co2Max, String descrizione, String url, Double prezzo) {
        this.nomeCategoria = nomeCategoria;
        this.co2Max = co2Max;
        this.descrizione = descrizione;
        this.url = url;
        this.prezzo = prezzo;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public String getCo2Max() {
        return co2Max;
    }

    public void setCo2Max(String co2Max) {
        this.co2Max = co2Max;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(Double prezzo) {
        this.prezzo = prezzo;
    }

    @Override
    public String toString() {
        return "CategoriaBean{" +
                "nomeCategoria='" + nomeCategoria + '\'' +
                ", co2Max='" + co2Max + '\'' +
                ", descrizione='" + descrizione + '\'' +
                ", url='" + url + '\'' +
                ", prezzo=" + prezzo +
                '}';
    }

}
