package storage;


import bean.OperatoreBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

public class OperatoreDao implements InterfacciaDao<OperatoreBean> {

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


    public synchronized OperatoreBean doRetrieveByEmailPass(String email, String password) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        OperatoreBean bean = new OperatoreBean();
        String selectSQL = "SELECT * FROM operatore WHERE email=? AND password=? ";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();


            if (rs.next()) {
                bean.setCognomeOperatore(rs.getString("cognome"));
                bean.setNomeOperatore(rs.getString("nome"));
                bean.setEmail(email);
                bean.setPassword(password);
                bean.setAdminCreatore(rs.getString("admin"));
                bean.setRegione(rs.getString("regione"));
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


    public synchronized OperatoreBean doRetrieveByEmail(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        OperatoreBean bean = new OperatoreBean();
        String selectSQL = "SELECT * FROM operatore WHERE email=?";



        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                bean.setCognomeOperatore(rs.getString("cognome"));
                bean.setNomeOperatore(rs.getString("nome"));
                bean.setEmail(email);
                bean.setPassword(rs.getString("password"));
                bean.setAdminCreatore(rs.getString("admin"));
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


    @Override
    public void doSave(OperatoreBean bean) throws SQLException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "Insert INTO operatore (email,password,cognome,nome,admin,regione) values (?,?,?,?,?,?)";


        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, bean.getEmail());
            preparedStatement.setString(2, bean.getPassword());
            preparedStatement.setString(3, bean.getCognomeOperatore());
            preparedStatement.setString(4, bean.getNomeOperatore());
            preparedStatement.setString(5,bean.getAdminCreatore());
            preparedStatement.setString(6,bean.getRegione());
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

        String deleteSQL = "DELETE FROM  operatore  WHERE email = ?";

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
    public OperatoreBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<OperatoreBean> doRetrieveAll() throws SQLException {
        return null;
    }
}
