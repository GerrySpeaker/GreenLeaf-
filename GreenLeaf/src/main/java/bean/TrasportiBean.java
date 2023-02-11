package bean;

/**
 * Classe che rappresenta l'entità Trasporti nel Database.
 **/
public class TrasportiBean {

  public String nomeTrasporto;
  public String url;
  public Integer co2Media;

  public TrasportiBean() {
  }

  /**
   * Costruttore della classe.
   **/
  public TrasportiBean(String nomeTrasporto, String url, Integer co2Media) {
    this.nomeTrasporto = nomeTrasporto;
    this.url = url;
    this.co2Media = co2Media;
  }

  public String getNomeTrasporto() {
    return nomeTrasporto;
  }

  public void setNomeTrasporto(String nomeTrasporto) {
    this.nomeTrasporto = nomeTrasporto;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public Integer getCo2Media() {
    return co2Media;
  }

  public void setCo2Media(Integer co2Media) {
    this.co2Media = co2Media;
  }

  @Override
  public String toString() {
    return "TrasportiBean{"
        + "nomeTrasporto='"
        + nomeTrasporto
        + '\''
        + ", url='"
        + url
        + '\''
        + ", co2Media="
        + co2Media
        + '}';
  }
}
