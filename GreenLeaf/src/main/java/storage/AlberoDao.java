package storage;

import bean.AdminBean;
import bean.AlberoBean;
import bean.CategoriaBean;
import bean.OrdineBean;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;

public class AlberoDao implements InterfacciaDao<AlberoBean>{

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


    public Collection<AlberoBean> doRetrieveBymail(String email) throws SQLException  {
        Connection connection = null;
        ArrayList<AlberoBean> prodotto = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        String selectSQL = "SELECT * FROM albero WHERE utenteAlbero = ?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, email);
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
                bean.setIot(rs.getInt("iot"));
                prodotto.add(bean);

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

        return prodotto;
    }

    @Override
    public void registrazione(AlberoBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public AlberoBean doRetrieveByKey(int code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        AlberoBean bean = new AlberoBean();
        String selectSQL = "SELECT * FROM albero WHERE idalbero=?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1, code);
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()) {
                bean.setIdAlbero(rs.getInt("idalbero"));
                bean.setCo2(rs.getString("CO2"));
                bean.setCategoria(rs.getString("categoria"));
                bean.setDataPiantumazione(rs.getDate("datapiantumazione"));
                bean.setStato(rs.getString("stato"));
                bean.setUtenteAlbero(rs.getString("utenteAlbero"));
                bean.setOrdine(rs.getInt("ordine"));
                bean.setRegione(rs.getString("regione"));
                bean.setIot(rs.getInt("iot"));
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
    public Collection<AlberoBean> doRetrieveAll() throws SQLException {
        return null;
    }

    public Boolean inserisciPiantumazione(int id) throws SQLException  {

        Connection connection = null;
        ArrayList<AlberoBean> prodotto = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        String selectSQL = "UPDATE albero SET stato=?, datapiantumazione=? WHERE idalbero = ?";

        LocalDate oggi = LocalDate.now();
        Date data = Date.valueOf(oggi);
        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, "Piantato" );
            preparedStatement.setDate(2, data);
            preparedStatement.setInt(3, id );
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

    public Boolean inserisciAlbero(CategoriaBean albero, OrdineBean ordineBean,String regione) throws SQLException  {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        String selectSQL = "INSERT INTO albero SET idalbero=?,CO2=?,categoria=?,datapiantumazione=?,stato=?,utenteAlbero=?,regione=?,ordine=?";
        String selectId = "SELECT MAX(idalbero) as Id FROM albero";


        int id = 0;

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectId);
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next())
            {
                id = (rs.getInt("Id")+1);
            }
        }finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }


        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setInt(1,id);
            preparedStatement.setString(2, albero.getCo2Max());
            preparedStatement.setString(3,albero.getNomeCategoria());
            preparedStatement.setDate(4,null);
            preparedStatement.setString(5, "Da Piantare");
            preparedStatement.setString(6,ordineBean.getUtenteOrdine());
            preparedStatement.setString(7,regione);
            preparedStatement.setInt(8,ordineBean.getIdOrdine());
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
