package storage;


import bean.AlberoBean;
import bean.OperatoreBean;

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

public class OperatoreDao implements InterfacciaDao<OperatoreBean> {


    public synchronized OperatoreBean login(String email, String password) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        OperatoreBean bean = new OperatoreBean();
        String selectSQL = "SELECT * FROM operatore WHERE email=? AND password=? ";

        String confpass = doRetrieveByEmail(email).getPassword();

        if(confpass != null){
            if(confpass.equals(password)){
                try {
                    connection = DriverManagerConnectionPool.getConnection();
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

        }

        return  null;
    }


    public synchronized OperatoreBean doRetrieveByEmail(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        OperatoreBean bean = new OperatoreBean();
        String selectSQL = "SELECT * FROM operatore WHERE email=?";



        try {
            connection = DriverManagerConnectionPool.getConnection();
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
    public void registrazione(OperatoreBean bean) throws SQLException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "Insert INTO operatore (email,password,cognome,nome,admin,regione) values (?,?,?,?,?,?)";


        try {
            connection = DriverManagerConnectionPool.getConnection();
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
    public boolean eliminaAccount(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        int result = 0;

        String deleteSQL = "DELETE FROM  operatore  WHERE email = ?";

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
    public OperatoreBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public Collection<OperatoreBean> doRetrieveAll() throws SQLException {
        return null;
    }
    public ArrayList<OperatoreBean> allOperatori(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        OperatoreBean bean = new OperatoreBean();
        String selectSQL = "SELECT * FROM operatore where admin=?";
        ArrayList<OperatoreBean> lista = new ArrayList<>();


        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

           while(rs.next()) {
               OperatoreBean operatore = new OperatoreBean();
                operatore.setNomeOperatore(rs.getString("nome"));
                operatore.setCognomeOperatore(rs.getString("cognome"));
                operatore.setEmail(rs.getString("email"));
                operatore.setRegione(rs.getString("regione"));
                operatore.setAdminCreatore(rs.getString("admin"));
                operatore.setPassword(rs.getString("password"));
                lista.add(operatore);
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

    public ArrayList<AlberoBean> visualizzaPiantumazioni(String email) throws SQLException {
        OperatoreDao operatoreDao = new OperatoreDao();
        OperatoreBean operatoreBean = operatoreDao.doRetrieveByEmail(email);
        ArrayList<AlberoBean> lista = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM albero WHERE stato = 'Da Piantare' AND regione = ?";


        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, operatoreBean.getRegione());
            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {
                AlberoBean bean = new AlberoBean();
                bean.setIdAlbero(rs.getInt("idalbero"));
                bean.setCo2(rs.getString("CO2"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setDataPiantumazione(rs.getDate("datapiantumazione"));
                bean.setStato(rs.getString("stato"));
                bean.setUtenteAlbero(rs.getString("utenteAlbero"));
                bean.setOrdine(rs.getInt("ordine"));
                bean.setRegione(rs.getString("regione"));
                lista.add(bean);

            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return  lista;
    }
}
