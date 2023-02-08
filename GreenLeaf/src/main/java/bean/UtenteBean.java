package bean;

import java.util.Date;

public class UtenteBean {

  public String email;
  public String password;
  public String cognomeUtente;
  public String nomeUtente;
  public Date dataNascita;

  public UtenteBean() {

  }

  public UtenteBean(String email, String password, String cognomeUtente, String nomeUtente,
                    Date dataNascita) {
    this.email = email;
    this.password = password;
    this.cognomeUtente = cognomeUtente;
    this.nomeUtente = nomeUtente;
    this.dataNascita = dataNascita;
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

  public String getCognomeUtente() {
    return cognomeUtente;
  }

  public void setCognomeUtente(String cognomeUtente) {
    this.cognomeUtente = cognomeUtente;
  }

  public String getNomeUtente() {
    return nomeUtente;
  }

  public void setNomeUtente(String nomeUtente) {
    this.nomeUtente = nomeUtente;
  }

  public Date getDataNascita() {
    return dataNascita;
  }

  public void setDataNascita(Date dataNascita) {
    this.dataNascita = dataNascita;
  }

  @Override
  public String toString() {
    return "UtenteBean{"
        + "email='"
        + email
        + '\''
        + ", password='"
        + password
        + '\''
        + ", cognomeUtente='"
        + cognomeUtente
        + '\''
        + ", nomeUtente='"
        + nomeUtente
        + '\''
        + ", dataNascita="
        + dataNascita
        + '}';
  }
}
