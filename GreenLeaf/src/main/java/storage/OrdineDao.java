package storage;

import application.Ordine;
import bean.AlberoBean;
import bean.OrdineBean;
import bean.UtenteBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

public class OrdineDao implements InterfacciaDao<OrdineBean> {
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
    public void registrazione(OrdineBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public OrdineBean doRetrieveByKey(int code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM ordine WHERE idordine=?";
        OrdineBean bean = new OrdineBean();

        try {

            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1,code);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
               bean.setIdOrdine(rs.getInt("idordine"));
               bean.setData(rs.getDate("DataOrdine"));
               bean.setTotale(rs.getDouble("Totale"));
               bean.setUtenteOrdine(rs.getString("Utente"));
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

    @Override
    public Collection<OrdineBean> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM ordine";
        ArrayList<OrdineBean> lista = new ArrayList<>();

        try {

            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
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
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return lista;
    }


    public int inserisciOrdine(String mail,Double totale)throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String selectSQL = "INSERT INTO ordine SET idordine=?,DataOrdine=?,Totale=?,Utente=?"; //non inserico ID in quanto è AI(auto incrementale)
        String selectId = "SELECT MAX(idordine) as Id FROM ordine";

        LocalDate oggi = LocalDate.now();
        Date data = Date.valueOf(oggi);

        int id = 0;

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectId);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next())
            {
                id = (rs.getInt("Id")+1);
            }
        }finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }


        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1,id);
            preparedStatement.setDate(2, data);
            preparedStatement.setDouble(3,totale);
            preparedStatement.setString(4,mail);
            preparedStatement.executeUpdate();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

        return id;
    }
}
