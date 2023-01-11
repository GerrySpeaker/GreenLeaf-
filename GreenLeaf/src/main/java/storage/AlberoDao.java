package storage;

import bean.AdminBean;
import bean.AlberoBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class AlberoDao implements InterfacciaDao<AlberoBean>{

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


    public Collection<AlberoBean> doRetrieveBymail(String email) throws SQLException  {
        Connection connection = null;
        ArrayList<AlberoBean> prodotto = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM albero WHERE utenteAlbero = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
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
                prodotto.add(bean);

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
        return null;
    }

    @Override
    public Collection<AlberoBean> doRetrieveAll() throws SQLException {
        return null;
    }


}
