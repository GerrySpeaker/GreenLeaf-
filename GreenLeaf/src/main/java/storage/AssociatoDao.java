package storage;

import bean.AssociatoBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Classe che contiene informazioni per accedere all'entità Catagoria.
 **/
public class AssociatoDao implements InterfacciaDao<AssociatoBean> {

  @Override
  public void registrazione(AssociatoBean bean) throws SQLException {

  }

  @Override
  public boolean eliminaAccount(String email) throws SQLException {
    return false;
  }

  @Override
  public AssociatoBean doRetrieveByKey(int code) throws SQLException {
    return null;
  }

  @Override
  public Collection<AssociatoBean> doRetrieveAll() throws SQLException {
    return null;
  }

  /**
   * Metodo che restituisce tutte le regioni associate a una data categoria.
   **/
  public Collection<AssociatoBean> doRetrieveAlbero(String nome) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String selectSql = "SELECT * FROM associato WHERE categoriaAssociato = ?";
    ArrayList<AssociatoBean> lista = new ArrayList<>();


    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setString(1, nome);
      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        AssociatoBean associato = new AssociatoBean();
        associato.setIdAssociato(rs.getInt("id"));
        associato.setCategoriaAssociato(rs.getString("categoriaAssociato"));
        associato.setRegioneAssociato(rs.getString("regioneAssociato"));
        lista.add(associato);
      }


    } finally {
      try {
        if (preparedStatement != null) {
          preparedStatement.close();
        }
      } finally {
        if (connection != null) {
          connection.close();
        }
      }
    }
    return lista;

  }
}
