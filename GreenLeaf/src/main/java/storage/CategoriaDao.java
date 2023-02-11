package storage;

import bean.CategoriaBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Classe che contiene informazioni per accedere all'entità Categoria.
 **/
public class CategoriaDao implements InterfacciaDao<CategoriaBean> {


  @Override
  public void registrazione(CategoriaBean bean) throws SQLException {

  }

  @Override
  public boolean eliminaAccount(String email) throws SQLException {
    return false;
  }

  @Override
  public CategoriaBean doRetrieveByKey(int code) throws SQLException {
    return null;
  }

  /**
   * Metodo che restituisce tutte le categorie.
   **/
  @Override
  public ArrayList<CategoriaBean> doRetrieveAll() throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ArrayList<CategoriaBean> prodotto = new ArrayList<>();
    String selectSql = "SELECT * FROM categoria";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      ResultSet rs = preparedStatement.executeQuery();

      while (rs.next()) {
        CategoriaBean bean = new CategoriaBean();
        bean.setNomeCategoria(rs.getString("nome"));
        bean.setCo2Max(rs.getString("CO2max"));
        bean.setDescrizione(rs.getString("descrizione"));
        bean.setPrezzo(rs.getDouble("prezzo"));
        bean.setUrl(rs.getString("url"));
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

  /**
   * Metodo che restituisce una categoria.
   **/
  public CategoriaBean doRetrieveByKeyAlbero(String categoria) throws SQLException {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    CategoriaBean bean = new CategoriaBean();
    String selectSql = "SELECT * FROM categoria WHERE nome=?";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setString(1, categoria);
      ResultSet rs = preparedStatement.executeQuery();

      if (rs.next()) {
        bean.setNomeCategoria(rs.getString("nome"));
        bean.setCo2Max(rs.getString("CO2max"));
        bean.setDescrizione(rs.getString("descrizione"));
        bean.setPrezzo(rs.getDouble("prezzo"));
        bean.setUrl(rs.getString("url"));
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


}
