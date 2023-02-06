package storage;

import bean.UtenteBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Collection;

public class UtenteDao implements InterfacciaDao<UtenteBean>{



    public synchronized UtenteBean login(String email, String password) throws SQLException {

        UtenteBean utente = doRetrieveByEmail(email);
        String confpass = utente.getPassword();
        if (confpass != null){ // se esiste l'utente con quell email
            if(confpass.equals(password)){
                Connection connection = null;
                PreparedStatement preparedStatement = null;
                UtenteBean bean = new UtenteBean();
                String selectSQL = "SELECT * FROM utente WHERE email=? AND Password=? ";
                try {
                    connection = DriverManagerConnectionPool.getConnection();
                    preparedStatement = connection.prepareStatement(selectSQL);
                    preparedStatement.setString(1, email);
                    preparedStatement.setString(2, password);
                    ResultSet rs = preparedStatement.executeQuery();


                    if (rs.next()) {
                        bean.setCognomeUtente(rs.getString("Cognome"));
                        bean.setNomeUtente(rs.getString("Nome"));
                        bean.setEmail(email);
                        bean.setPassword(password);
                        bean.setDataNascita(rs.getDate("DataDiNascita"));
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


        return null;

    }

    public synchronized UtenteBean doRetrieveByEmail(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM utente WHERE email=?";
        UtenteBean bean = new UtenteBean();

        try {

            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1,email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                bean.setCognomeUtente(rs.getString("Cognome"));
                bean.setNomeUtente(rs.getString("Nome"));
                bean.setEmail(email);
                bean.setPassword(rs.getString("Password"));
                bean.setDataNascita(rs.getDate("DataDiNascita"));
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
    public void registrazione(UtenteBean bean) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "Insert INTO utente (email,Cognome, Nome, Password, DataDiNascita) values (?,?,?,?,?)";


        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, bean.getEmail());
            preparedStatement.setString(2, bean.getCognomeUtente());
            preparedStatement.setString(3, bean.getNomeUtente());
            preparedStatement.setString(4, bean.getPassword());
            preparedStatement.setDate(5, (Date) bean.getDataNascita());
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

        System.out.println("Chiamata la funzione per eliminare l'account utente");
        int result = 0;

        String deleteSQL = "DELETE FROM  utente  WHERE email = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
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
    public UtenteBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }


    @Override
    public Collection<UtenteBean> doRetrieveAll() throws SQLException {
        return null;
    }




}
