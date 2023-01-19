package storage;

import bean.BuonoregaloBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class BuonoRegaloDao implements InterfacciaDao<BuonoregaloBean> {
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
    public void registrazione(BuonoregaloBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public BuonoregaloBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<BuonoregaloBean> doRetrieveAll() throws SQLException {
        return null;
    }

    public ArrayList<BuonoregaloBean> doRetriveByUtente(String email) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<BuonoregaloBean> lista = new ArrayList<>();
        String selectSQL = "SELECT * FROM buonoregalo WHERE utenteRegalo=?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                BuonoregaloBean bean = new BuonoregaloBean();
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setUtenteRegalo(rs.getString("utenteRegalo"));
                bean.setIdBuonoregalo(rs.getString("key"));
                bean.setStato(rs.getString("stato"));
                bean.setOrdineRegalo(rs.getInt("ordineRegalo"));
                lista.add(bean);
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
        return lista;

    }

}

