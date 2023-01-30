package storage;

import bean.OperatoreBean;
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

public class TrasportiDao implements InterfacciaDao<TrasportiBean>{
    @Override
    public void registrazione(TrasportiBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public TrasportiBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<TrasportiBean> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        TrasportiBean bean = new TrasportiBean();
        String selectSQL = "SELECT * FROM trasporti";
        ArrayList<TrasportiBean> lista = new ArrayList<>();


        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                TrasportiBean trasporti = new TrasportiBean();
                trasporti.setNomeTrasporto(rs.getString("Nome"));
                trasporti.setCo2Media(rs.getInt("CO2Media"));
                trasporti.setUrl(rs.getString("url"));
                lista.add(trasporti);
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
        System.out.println(lista.toString());
        return lista;
    }
}
