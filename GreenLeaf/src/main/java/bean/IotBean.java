package bean;

public class IotBean {

  public Integer idIot;
  public String ipv4;
  public String latitudine;
  public String longitudine;
  public String altitudine;
  public String regione;
  public String stato;

  public IotBean() {
  }

  public IotBean(Integer idIot, String ipv4, String latitudine, String longitudine,
                 String altitudine, String regione, String stato) {
    this.idIot = idIot;
    this.ipv4 = ipv4;
    this.latitudine = latitudine;
    this.longitudine = longitudine;
    this.altitudine = altitudine;
    this.regione = regione;
    this.stato = stato;
  }

  public Integer getIdIot() {
    return idIot;
  }

  public void setIdIot(Integer idIot) {
    this.idIot = idIot;
  }

  public String getIpv4() {
    return ipv4;
  }

  public void setIpv4(String ipv4) {
    this.ipv4 = ipv4;
  }

  public String getLatitudine() {
    return latitudine;
  }

  public void setLatitudine(String latitudine) {
    this.latitudine = latitudine;
  }

  public String getLongitudine() {
    return longitudine;
  }

  public void setLongitudine(String longitudine) {
    this.longitudine = longitudine;
  }

  public String getAltitudine() {
    return altitudine;
  }

  public void setAltitudine(String altitudine) {
    this.altitudine = altitudine;
  }

  public String getRegione() {
    return regione;
  }

  public void setRegione(String regione) {
    this.regione = regione;
  }

  public String getStato() {
    return stato;
  }

  public void setStato(String stato) {
    this.stato = stato;
  }

  @Override
  public String toString() {
    return "IotBean{"
        + "idIot="
        + idIot
        + ", ipv4='"
        + ipv4
        + '\''
        + ", latitudine='"
        + latitudine
        + '\''
        + ", longitudine='"
        + longitudine
        + '\''
        + ", altitudine='"
        + altitudine
        + '\''
        + ", regione='"
        + regione
        + '\''
        + ", stato='"
        + stato
        + '\''
        + '}';
  }
}
