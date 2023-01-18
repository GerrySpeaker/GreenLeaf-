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

    public Boolean inserisciIot(Integer id, String ip, String x, String y, String z) throws SQLException {

        Connection connection = null;
        IotBean iotBean = new IotBean();
        PreparedStatement preparedStatement = null;
        String selectSQL = "Insert into iot SET idiot=?, IPV4=?, latitudine=?, longitudine=?, altitudine=?";
        String getId = "SELECT MAX(IPV4) as id FROM iot";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(getId);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){

                iotBean.setIdIot(rs.getInt("IPV4") + 1);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
            if (connection != null)
                connection.close();
            }
        }
        try{

            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, x);
            preparedStatement.setString(3, y);
            preparedStatement.setString(4, z);
            preparedStatement.executeQuery();

            return true;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

    }

}
