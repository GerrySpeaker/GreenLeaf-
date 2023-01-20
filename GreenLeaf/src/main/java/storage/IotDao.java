package storage;

import bean.AlberoBean;
import bean.IotBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class IotDao {

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

    public IotBean doRetriveByKey(Integer id) throws SQLException {

        Connection connection = null;
        IotBean bean = new IotBean();
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM iot WHERE idiot=?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                bean.setIdIot(rs.getInt("idiot"));
                bean.setIpv4(rs.getString("IPV4"));
                bean.setAltitudine(rs.getString("altitudine"));
                bean.setLongitudine(rs.getString("longitudine"));
                bean.setStato(rs.getString("stato"));
                bean.setLatitudine(rs.getString("latitudine"));
                bean.setRegione(rs.getString("regione"));
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