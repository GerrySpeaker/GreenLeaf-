package storage;

import bean.AdminBean;
import bean.OperatoreBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class AdminDao implements InterfacciaDao<AdminBean>{

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


    public synchronized AdminBean login(String email, String password) throws SQLException {

        String confpass = doRetrieveByEmail(email).getPassword();
        System.out.println(confpass);

        if(confpass != null){
            if(confpass.equals(password)){
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
                        bean.setEmail(rs.getString("email"));
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

        }

    return null;

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
    public void registrazione(AdminBean bean) throws SQLException {
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
    public boolean eliminaAccount(String email) throws SQLException {
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
