package storage;

import bean.IotBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IotDao {


  public IotBean doRetrieveByKey(Integer id) throws SQLException {

    Connection connection = null;
    IotBean bean = new IotBean();
    PreparedStatement preparedStatement = null;
    String selectSql = "SELECT * FROM iot WHERE idiot=?";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setInt(1, id);
      ResultSet rs = preparedStatement.executeQuery();

      if (rs.next()) {
        bean.setIdIot(rs.getInt("idiot"));
        bean.setIpv4(rs.getString("IPV4"));
        bean.setAltitudine(rs.getString("altitudine"));
        bean.setLongitudine(rs.getString("longitudine"));
        bean.setStato(rs.getString("stato"));
        bean.setLatitudine(rs.getString("latitudine"));
        bean.setRegione(rs.getString("regione"));
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

  public IotBean doRetrieveByRegione(String regione) throws SQLException {

    Connection connection = null;
    IotBean bean = new IotBean();
    PreparedStatement preparedStatement = null;
    String selectSql = "SELECT * FROM iot WHERE regione=? AND stato='Non usato' LIMIT 1";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setString(1, regione);
      ResultSet rs = preparedStatement.executeQuery();

      if (rs.next()) {
        bean.setIdIot(rs.getInt("idiot"));
        bean.setIpv4(rs.getString("IPV4"));
        bean.setAltitudine(rs.getString("altitudine"));
        bean.setLongitudine(rs.getString("longitudine"));
        bean.setStato(rs.getString("stato"));
        bean.setLatitudine(rs.getString("latitudine"));
        bean.setRegione(rs.getString("regione"));
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

  public Boolean cambioStatoIot(int id) throws SQLException {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    String selectSql = "UPDATE iot SET stato=? WHERE idiot = ?";

    try {
      connection = DriverManagerConnectionPool.getConnection();
      preparedStatement = connection.prepareStatement(selectSql);
      preparedStatement.setString(1, "Usato");
      preparedStatement.setInt(2, id);
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
    return false;
  }
}