package storage;

import bean.AlberoBean;
import bean.BuonoregaloBean;
import bean.OrdineBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;

public class BuonoRegaloDao implements InterfacciaDao<BuonoregaloBean> {



    @Override
    public void registrazione(BuonoregaloBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public BuonoregaloBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    public ArrayList<BuonoregaloBean> buoniUtenteAcquistati(String email) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<BuonoregaloBean> lista = new ArrayList<>();
        String selectId = "SELECT MAX(ordineRegalo) as maxordine FROM buonoregalo WHERE utenteRegalo = ?";
        int id = 0;
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectId);
                preparedStatement.setString(1, email);
                ResultSet rs1 = preparedStatement.executeQuery();
                if (rs1.next()) {
                        id = (rs1.getInt("maxordine"));
                }
                String selectSQL = "SELECT * FROM buonoregalo WHERE ordineRegalo = ? AND utenteRegalo=?";
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
                preparedStatement.setInt(1, id);
                preparedStatement.setString(2,email);
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()) {
                    BuonoregaloBean bean = new BuonoregaloBean();
                    bean.setPrezzo(rs.getDouble("prezzo"));
                    bean.setUtenteRegalo(rs.getString("utenteRegalo"));
                    bean.setIdBuonoregalo(rs.getString("idBuono"));
                    bean.setStato(rs.getString("stato"));
                    bean.setOrdineRegalo(rs.getInt("ordineRegalo"));
                    lista.add(bean);
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


    public BuonoregaloBean RiscattaBuono(String key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        BuonoregaloBean bean = new BuonoregaloBean();
        String selectSQL = "SELECT * FROM buonoregalo WHERE idBuono=?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, key);
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()) {
                bean.setIdBuonoregalo(rs.getString("idBuono"));
                bean.setStato(rs.getString("stato"));
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setUtenteRegalo(rs.getString("utenteRegalo"));
                bean.setOrdineRegalo(rs.getInt("ordineRegalo"));
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

    public void eliminaBuono(String key)throws  SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String deleteSQL = "DELETE FROM  buonoregalo  WHERE idBuono = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setString(1,key);
            preparedStatement.executeUpdate();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }

    }

    public Boolean CambioStato (String key) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        BuonoregaloBean bean = new BuonoregaloBean();
        String selectSQL = "UPDATE buonoregalo SET stato='Riscattato' WHERE idBuono = ?";
        boolean check = false;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, key);
            Integer rs = preparedStatement.executeUpdate();


            if(rs != 0){
                check = true;
            }

        } finally {
            try {
                if (preparedStatement != null){
                    preparedStatement.close();
                }

            } finally {
                if (connection != null)
                    connection.close();
            }
        }
      return  check;
    }

    @Override
    public Collection<BuonoregaloBean> doRetrieveAll() throws SQLException {
        return null;
    }

    public ArrayList<BuonoregaloBean> doRetriveByUtente(String email) throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<BuonoregaloBean> lista = new ArrayList<>();
        String selectSQL = "SELECT * FROM buonoregalo WHERE utenteRegalo=?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                BuonoregaloBean bean = new BuonoregaloBean();
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setUtenteRegalo(rs.getString("utenteRegalo"));
                bean.setIdBuonoregalo(rs.getString("idBuono"));
                bean.setStato(rs.getString("stato"));
                bean.setOrdineRegalo(rs.getInt("ordineRegalo"));
                lista.add(bean);
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

    public Boolean InserisciBuono(OrdineBean ordine,String chiave)throws SQLException{
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "INSERT INTO buonoregalo SET idBuono=?,stato=?,prezzo=?,utenteRegalo=?,ordineRegalo=?";


        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, chiave);
            preparedStatement.setString(2, "Da riscattare");
            preparedStatement.setDouble(3, Double.valueOf(50));
            preparedStatement.setString(4, ordine.getUtenteOrdine());
            preparedStatement.setInt(5, ordine.getIdOrdine());
            preparedStatement.executeUpdate();

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return false;
    }

}

