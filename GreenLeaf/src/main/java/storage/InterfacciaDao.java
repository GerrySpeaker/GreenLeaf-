package storage;


import java.sql.SQLException;
import java.util.Collection;

public interface InterfacciaDao<T>{

    void doSave(T bean) throws SQLException;
    boolean doDelete(String email) throws SQLException;
    T doRetrieveByKey(int code) throws SQLException;
    Collection<T> doRetrieveAll()throws SQLException;

}