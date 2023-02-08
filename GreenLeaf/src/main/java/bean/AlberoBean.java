package bean;

import java.util.Date;

/**
 * Questa classe rappresenta l'entità Albero.
 **/
public class AlberoBean {

  public Integer idAlbero;
  public Integer ordine;
  public Integer iot;
  public String co2;
  public String categoria;
  public String stato;
  public String utenteAlbero;
  public String regione;
  public Date dataPiantumazione;

  public AlberoBean() {
  }

  /**
   * Cosytruttore della classe.
   **/
  public AlberoBean(Integer idAlbero, Integer ordine, String co2, String categoria, String stato,
                    String utenteAlbero, Date dataPiantumazione, String regione, Integer iot) {
    this.idAlbero = idAlbero;
    this.ordine = ordine;
    this.co2 = co2;
    this.categoria = categoria;
    this.stato = stato;
    this.utenteAlbero = utenteAlbero;
    this.dataPiantumazione = dataPiantumazione;
    this.regione = regione;
    this.iot = iot;
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

  public Integer getIot() {
    return iot;
  }

  public void setIot(Integer iot) {
    this.iot = iot;
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

  public String getRegione() {
    return regione;
  }

  public void setRegione(String regione) {
    this.regione = regione;
  }

  public Date getDataPiantumazione() {
    return dataPiantumazione;
  }

  public void setDataPiantumazione(Date dataPiantumazione) {
    this.dataPiantumazione = dataPiantumazione;
  }

  @Override
  public String toString() {
    return "AlberoBean{"
        + "idAlbero="
        + idAlbero
        + ", ordine="
        + ordine
        + ", iot="
        + iot
        + ", co2='"
        + co2
        + '\''
        + ", categoria='"
        + categoria
        + '\''
        + ", stato='"
        + stato
        + '\''
        + ", utenteAlbero='"
        + utenteAlbero
        + '\''
        + ", regione='"
        + regione
        + '\''
        + ", dataPiantumazione="
        + dataPiantumazione
        + '}';
  }
}
