package storage;


import java.sql.SQLException;
import java.util.Collection;

/**
 * Interfaccia dei dao.
 **/
public interface InterfacciaDao<T> {

  void registrazione(T bean) throws SQLException;

  boolean eliminaAccount(String email) throws SQLException;

  T doRetrieveByKey(int code) throws SQLException;

  Collection<T> doRetrieveAll() throws SQLException;

}