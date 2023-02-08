package storage;

import bean.AlberoBean;
import bean.CategoriaBean;
import bean.IotBean;
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
 * Classe che contiene informazioni per accedere all'entità Albero.
 **/
public class AlberoDao implements InterfacciaDao<AlberoBean> {

  /**
   * Metodo che restituisce tutti gli alberi adottati da un dato utente.
   **/
  public Collection<AlberoBean> doRetrieveBymail(String email) throws SQLException {
    Connection connection = null;
    ArrayList<AlberoBean> prodotto = new ArrayList<>();
    PreparedStatement preparedStatement = null;
    String selectSql = "SELECT * FROM albero WHERE utenteAlbero = ?";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setString(1, email);
      ResultSet rs = preparedStatement.executeQuery();


      while (rs.next()) {
        AlberoBean bean = new AlberoBean();
        bean.setIdAlbero(rs.getInt("idalbero"));
        bean.setCo2(rs.getString("CO2"));
        bean.setCategoria(rs.getString("categoria"));
        bean.setDataPiantumazione(rs.getDate("datapiantumazione"));
        bean.setStato(rs.getString("stato"));
        bean.setUtenteAlbero(rs.getString("utenteAlbero"));
        bean.setOrdine(rs.getInt("ordine"));
        bean.setRegione(rs.getString("regione"));
        bean.setIot(rs.getInt("iot"));
        prodotto.add(bean);

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

    return prodotto;
  }

  @Override
  public void registrazione(AlberoBean bean) throws SQLException {

  }

  @Override
  public boolean eliminaAccount(String email) throws SQLException {
    return false;
  }

  @Override
  public AlberoBean doRetrieveByKey(int code) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    AlberoBean bean = new AlberoBean();
    String selectSql = "SELECT * FROM albero WHERE idalbero=?";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setInt(1, code);
      ResultSet rs = preparedStatement.executeQuery();

      if (rs.next()) {
        bean.setIdAlbero(rs.getInt("idalbero"));
        bean.setCo2(rs.getString("CO2"));
        bean.setCategoria(rs.getString("categoria"));
        bean.setDataPiantumazione(rs.getDate("datapiantumazione"));
        bean.setStato(rs.getString("stato"));
        bean.setUtenteAlbero(rs.getString("utenteAlbero"));
        bean.setOrdine(rs.getInt("ordine"));
        bean.setRegione(rs.getString("regione"));
        bean.setIot(rs.getInt("iot"));
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

  /**
   * Metodo che restituisce tutti gli alberi presenti nel DB.
   **/
  @Override
  public Collection<AlberoBean> doRetrieveAll() throws SQLException {
    return null;
  }

  /**
   * Metodo che aggiorna lo stato dell'albero una volta che è stato piantato.
   **/
  public Boolean inserisciPiantumazione(int id) throws SQLException {

    Connection connection = null;
    ArrayList<AlberoBean> prodotto = new ArrayList<>();
    PreparedStatement preparedStatement = null;
    String selectSql = "UPDATE albero SET stato=?, datapiantumazione=? WHERE idalbero = ?";
    boolean check = false;

    LocalDate oggi = LocalDate.now();
    Date data = Date.valueOf(oggi);
    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setString(1, "Piantato");
      preparedStatement.setDate(2, data);
      preparedStatement.setInt(3, id);
      Integer rs = preparedStatement.executeUpdate();

      if (rs != 0) {
        check = true;
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
    return check;
  }

  /**
   * Metodo che inserisce un albero nel Database.
   **/

  public int inserisciAlbero(CategoriaBean albero, OrdineBean ordineBean, String regione,
                             IotBean iot) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String selectSql = "INSERT INTO albero SET idalbero=?,CO2=?,categoria=?,"
        + "datapiantumazione=?,stato=?,utenteAlbero=?,regione=?,ordine=?,iot=?";
    String selectId = "SELECT MAX(idalbero) as Id FROM albero";


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
      preparedStatement.setString(2, albero.getCo2Max());
      preparedStatement.setString(3, albero.getNomeCategoria());
      preparedStatement.setDate(4, null);
      preparedStatement.setString(5, "Da Piantare");
      preparedStatement.setString(6, ordineBean.getUtenteOrdine());
      preparedStatement.setString(7, regione);
      preparedStatement.setInt(8, ordineBean.getIdOrdine());
      preparedStatement.setInt(9, iot.getIdIot());
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
