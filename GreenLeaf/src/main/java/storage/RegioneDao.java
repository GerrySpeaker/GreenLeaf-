package storage;

import bean.RegioneBean;
import bean.TrasportiBean;

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


public class RegioneDao implements InterfacciaDao<RegioneBean>{

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
    public void registrazione(RegioneBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public RegioneBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    public RegioneBean doRetrieveByNome(String nome) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM regione WHERE nome = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, nome);
            ResultSet rs = preparedStatement.executeQuery();


            RegioneBean regione = new RegioneBean();
            regione.setNomeRegione(rs.getString("nome"));
            regione.setUrl(rs.getString("url"));


            return regione;

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

    }

    @Override
    public Collection<RegioneBean> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM regione";
        ArrayList<RegioneBean> lista = new ArrayList<>();


        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                RegioneBean regione = new RegioneBean();
                regione.setNomeRegione(rs.getString("nome"));
                regione.setUrl(rs.getString("url"));
                lista.add(regione);
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
