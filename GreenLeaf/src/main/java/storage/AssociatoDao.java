package storage;

import bean.AlberoBean;
import bean.AssociatoBean;
import bean.RegioneBean;

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

public class AssociatoDao implements InterfacciaDao<AssociatoBean>{
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

    @Override
    public Collection<AssociatoBean> doRetrieveAll() throws SQLException {
        return null;
    }

    public Collection<AssociatoBean> doRetrieveAlbero(String nome) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM associato WHERE categoriaAssociato = ?";
        ArrayList<AssociatoBean> lista = new ArrayList<>();


        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, nome);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                AssociatoBean associato = new AssociatoBean();
                associato.setIdAssociato(rs.getInt("id"));
                associato.setCategoriaAssociato(rs.getString("categoriaAssociato"));
                associato.setRegioneAssociato(rs.getString("regioneAssociato"));
                lista.add(associato);
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
