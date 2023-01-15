package storage;

import bean.AlberoBean;
import bean.CategoriaBean;
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

public class CategoriaDao implements InterfacciaDao<CategoriaBean>{

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

    @Override
    public void registrazione(CategoriaBean bean) throws SQLException {

    }

    @Override
    public boolean eliminaAccount(String email) throws SQLException {
        return false;
    }

    @Override
    public CategoriaBean doRetrieveByKey(int code) throws SQLException {
        return null;
    }

    @Override
    public ArrayList<CategoriaBean> doRetrieveAll() throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<CategoriaBean> prodotto = new ArrayList<>();
        String selectSQL = "SELECT * FROM categoria";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                CategoriaBean bean = new CategoriaBean();
                bean.setNomeCategoria(rs.getString("nome"));
                bean.setCo2Max(rs.getString("CO2max"));
                bean.setDescrizione(rs.getString("descrizione"));
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setUrl(rs.getString("url"));
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



    public CategoriaBean doRetrieveByKeyAlbero(String categoria) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        CategoriaBean bean = new CategoriaBean();
        String selectSQL = "SELECT * FROM categoria WHERE nome=?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, categoria);
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()) {
                bean.setNomeCategoria(rs.getString("nome"));
                bean.setCo2Max(rs.getString("CO2max"));
                bean.setDescrizione(rs.getString("descrizione"));
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setUrl(rs.getString("url"));
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

    public ArrayList<String> doRetriveByAssociato(String regione) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ArrayList<String> lista = new ArrayList<>();
        String selectSQL = "SELECT nome,CO2max,descrizione,prezzo,url,regioneAssociato FROM categoria,associato where nome=categoriaAssociato AND regioneAssociato=?";

        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, regione);
            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next()) {
                String nome,co2,desc,url,regioneAssociato;
                Double prezzo;
                nome = rs.getString("nome");
                co2 = rs.getString("CO2max");
                desc = rs.getString("descrizione");
                prezzo = rs.getDouble("prezzo");
                url = rs.getString("url");
                regioneAssociato = rs.getString("regioneAssociato");
                lista.add(nome);
                lista.add(co2);
                lista.add(desc);
                lista.add(prezzo.toString());
                lista.add(url);
                lista.add(regioneAssociato);
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


}
