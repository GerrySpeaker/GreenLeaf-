package storage;

import bean.AssociatoBean;
import bean.CategoriaBean;

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

public class AssociatoDao implements InterfacciaDao<AssociatoBean> {

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
    public Collection<AssociatoBean> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<AssociatoBean> prodotto = new ArrayList<>();
        String selectSQL = "SELECT * FROM associato";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                AssociatoBean associatoBean = new AssociatoBean();
                associatoBean.setIdAssociato(rs.getInt("id"));
                associatoBean.setCategoriaAssociato(rs.getString("categoriaAssociato"));
                associatoBean.setRegioneAssociato(rs.getString("regioneAssociato"));
                prodotto.add(associatoBean);
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
        return (ArrayList<AssociatoBean>)prodotto;
    }


    @Override
    public void registrazione(AssociatoBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public AssociatoBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    public Collection<AssociatoBean> doRetriveByRegione(String regione) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<AssociatoBean> prodotto = new ArrayList<>();
        String selectSQL = "SELECT * FROM associato WHERE regioneAssociato =?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1,regione);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                AssociatoBean associatoBean = new AssociatoBean();
                associatoBean.setIdAssociato(rs.getInt("id"));
                associatoBean.setCategoriaAssociato(rs.getString("categoriaAssociato"));
                associatoBean.setRegioneAssociato(rs.getString("regioneAssociato"));
                prodotto.add(associatoBean);
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
        return (ArrayList<AssociatoBean>)prodotto;
    }
}
