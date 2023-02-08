package bean;

public class RegioneBean {

  public String nomeRegione;
  public String url;

  public RegioneBean() {
  }

  public RegioneBean(String nomeRegione, String url) {
    this.nomeRegione = nomeRegione;
    this.url = url;
  }

  public String getNomeRegione() {
    return nomeRegione;
  }

  public void setNomeRegione(String nomeRegione) {
    this.nomeRegione = nomeRegione;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  @Override
  public String toString() {
    return "RegioneBean{"
        + "nomeRegione='"
        + nomeRegione
        + '\''
        + ", url='"
        + url
        + '\''
        + '}';
  }
}
