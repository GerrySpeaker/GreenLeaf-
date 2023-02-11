package storage;

import bean.OrdineBean;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Classe che contiene informazioni per accedere all'entità Ordine.
 **/
public class OrdineDao implements InterfacciaDao<OrdineBean> {


  @Override
  public void registrazione(OrdineBean bean) throws SQLException {

  }

  @Override
  public boolean eliminaAccount(String email) throws SQLException {
    return false;
  }

  /**
   * Metodo che permettere di eliminare l'Ordine in base all'id.
   **/
  public void eliminaOrdine(int ordine) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String deleteSql = "DELETE FROM  ordine  WHERE idordine = ?";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(deleteSql);
      preparedStatement.setInt(1, ordine);
      preparedStatement.executeUpdate();

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
  }

  @Override
  public OrdineBean doRetrieveByKey(int code) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String selectSql = "SELECT * FROM ordine WHERE idordine=?";
    OrdineBean bean = new OrdineBean();

    try {

      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setInt(1, code);
      ResultSet rs = preparedStatement.executeQuery();

      if (rs.next()) {
        bean.setIdOrdine(rs.getInt("idordine"));
        bean.setData(rs.getDate("DataOrdine"));
        bean.setTotale(rs.getDouble("Totale"));
        bean.setUtenteOrdine(rs.getString("Utente"));
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
    return bean;
  }

  @Override
  public Collection<OrdineBean> doRetrieveAll() throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String selectSql = "SELECT * FROM ordine";
    ArrayList<OrdineBean> lista = new ArrayList<>();

    try {

      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        OrdineBean bean = new OrdineBean();
        bean.setIdOrdine(rs.getInt("idordine"));
        bean.setData(rs.getDate("DataOrdine"));
        bean.setTotale(rs.getDouble("Totale"));
        bean.setUtenteOrdine(rs.getString("Utente"));
        lista.add(bean);
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

  /**
   * Metodo che permettere l'inserimento dell'Ordine all'interno del Database.
   **/
  public int inserisciOrdine(String mail, Double totale) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectSql =
        "INSERT INTO ordine SET idordine=?,DataOrdine=?,Totale=?,Utente=?";
    //non inserico ID in quanto è AI(auto incrementale)
    String selectId = "SELECT MAX(idordine) as Id FROM ordine";

    LocalDate oggi = LocalDate.now();
    Date data = Date.valueOf(oggi);

    int id = 0;

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectId);
      ResultSet rs = preparedStatement.executeQuery();
      if (rs.next()) {
        id = (rs.getInt("Id") + 1);
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


    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setInt(1, id);
      preparedStatement.setDate(2, data);
      preparedStatement.setDouble(3, totale);
      preparedStatement.setString(4, mail);
      preparedStatement.executeUpdate();

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

    return id;
  }
}
