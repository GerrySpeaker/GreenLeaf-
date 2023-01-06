package storage;

import bean.AdminBean;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;

public class AdminDao implements InterfacciaDao<AdminBean>{

    private static DataSource ds;

    static {

        DriverManagerConnectionPool db;
        Connection connection = null;
        try {
            connection = DriverManagerConnectionPool.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public synchronized AdminBean doRetrieveByEmailPass(String email, String password) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        AdminBean bean = new AdminBean();
        String selectSQL = "SELECT * FROM admin WHERE email=? AND password=? ";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();


            if (rs.next()) {
                bean.setCognomeAdmin(rs.getString("cognome"));
                bean.setNomeAdmin(rs.getString("nome"));
                bean.setEmail(email);
                bean.setPassword(password);
            }

            System.out.println(bean.toString());

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

    public synchronized AdminBean doRetrieveByEmail(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        AdminBean bean = new AdminBean();
        String selectSQL = "SELECT * FROM admin WHERE email=?";



        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                bean.setCognomeAdmin(rs.getString("cognome"));
                bean.setNomeAdmin(rs.getString("nome"));
                bean.setEmail(email);
                bean.setPassword(rs.getString("password"));
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
    public void doSave(AdminBean bean) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "Insert INTO utente (email,password,cognome,nome) values (?,?,?,?)";


        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, bean.getEmail());
            preparedStatement.setString(2, bean.getPassword());
            preparedStatement.setString(3, bean.getCognomeAdmin());
            preparedStatement.setString(4, bean.getNomeAdmin());
            preparedStatement.executeUpdate();
        }

        finally {
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
    public boolean doDelete(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM  admin  WHERE email = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setString(1,email);

            result = preparedStatement.executeUpdate();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return (result != 0);
    }


    @Override
    public AdminBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }


    @Override
    public Collection<AdminBean> doRetrieveAll() throws SQLException {
        return null;
    }

}
