package bean;

public class AssociatoBean {

  public Integer idAssociato;
  public String categoriaAssociato;
  public String regioneAssociato;

  public AssociatoBean() {
  }

  public AssociatoBean(Integer idAssociato, String categoriaAssociato, String regioneAssociato) {
    this.idAssociato = idAssociato;
    this.categoriaAssociato = categoriaAssociato;
    this.regioneAssociato = regioneAssociato;
  }

  public Integer getIdAssociato() {
    return idAssociato;
  }

  public void setIdAssociato(Integer idAssociato) {
    this.idAssociato = idAssociato;
  }

  public String getCategoriaAssociato() {
    return categoriaAssociato;
  }

  public void setCategoriaAssociato(String categoriaAssociato) {
    this.categoriaAssociato = categoriaAssociato;
  }

  public String getRegioneAssociato() {
    return regioneAssociato;
  }

  public void setRegioneAssociato(String regioneAssociato) {
    this.regioneAssociato = regioneAssociato;
  }

  @Override
  public String toString() {
    return "AssociatoBean{"
        + "idAssociato="
        + idAssociato
        + ", categoriaAssociato='"
        + categoriaAssociato
        + '\''
        + ", regioneAssociato='"
        + regioneAssociato
        + '\''
        + '}';
  }
}
