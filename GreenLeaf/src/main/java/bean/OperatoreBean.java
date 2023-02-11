package bean;

/**
 * Questa classe rappresenta l'entità Operatore.
 **/
public class OperatoreBean {

  public String email;
  public String password;
  public String nomeOperatore;
  public String cognomeOperatore;
  public String adminCreatore;
  public String regione;

  public OperatoreBean() {
  }

  /**
   * Costruttore della classe.
   **/
  public OperatoreBean(String email, String password, String nomeOperatore,
                       String cognomeOperatore,
                       String adminCreatore, String regione) {
    this.email = email;
    this.password = password;
    this.nomeOperatore = nomeOperatore;
    this.cognomeOperatore = cognomeOperatore;
    this.adminCreatore = adminCreatore;
    this.regione = regione;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getNomeOperatore() {
    return nomeOperatore;
  }

  public void setNomeOperatore(String nomeOperatore) {
    this.nomeOperatore = nomeOperatore;
  }

  public String getCognomeOperatore() {
    return cognomeOperatore;
  }

  public void setCognomeOperatore(String cognomeOperatore) {
    this.cognomeOperatore = cognomeOperatore;
  }

  public String getAdminCreatore() {
    return adminCreatore;
  }

  public void setAdminCreatore(String adminCreatore) {
    this.adminCreatore = adminCreatore;
  }

  public String getRegione() {
    return regione;
  }

  public void setRegione(String regione) {
    this.regione = regione;
  }

  @Override
  public String toString() {
    return "OperatoreBean{"
        + "email='"
        + email
        + '\''
        + ", password='"
        + password
        + '\''
        + ", nomeOperatore='"
        + nomeOperatore
        + '\''
        + ", cognomeOperatore='"
        + cognomeOperatore
        + '\''
        + ", adminCreatore='"
        + adminCreatore
        + '\''
        + ", regione='"
        + regione
        + '\''
        + '}';
  }
}
