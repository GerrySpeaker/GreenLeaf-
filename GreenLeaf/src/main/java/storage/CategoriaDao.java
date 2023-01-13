package storage;

import bean.AlberoBean;
import bean.CategoriaBean;
import bean.OperatoreBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

public class CategoriaDao implements InterfacciaDao<CategoriaBean>{

    private static DataSource ds;

    static {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");

            ds = (DataSource) envCtx.lookup("jdbc/greenleaf");

        } catch (NamingException e) {
            System.out.println("Error:" + e.getMessage());
        }
    }

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

    @Override
    public Collection<CategoriaBean> doRetrieveAll() throws SQLException {
        return null;
    }


    public CategoriaBean doRetrieveByKeyAlbero(String categoria) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        CategoriaBean bean = new CategoriaBean();
        String selectSQL = "SELECT * FROM categoria WHERE nome=?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, categoria);
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()) {
                bean.setNomeCategoria(rs.getString("nome"));
                bean.setCo2Max(rs.getString("CO2max"));
                bean.setDescrizione(rs.getString("descrizione"));
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setUrl(rs.getString("url"));
            }

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return bean;
    }


}
