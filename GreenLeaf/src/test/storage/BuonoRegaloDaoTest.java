package storage;


import bean.BuonoregaloBean;
import bean.OrdineBean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

public class BuonoRegaloDaoTest{
    static BuonoRegaloDao dao= new BuonoRegaloDao();
    static OrdineDao ordineDao = new OrdineDao();

    public OrdineBean ordineBean = new OrdineBean();
    public BuonoregaloBean buonoregaloBean = new BuonoregaloBean("kyzffgdfrg","Da riscattare","mirko@gmail.com", 50.0,33);
    int id = 0;

    @Before
    public void setUp() throws SQLException {
        System.out.println("Registrazione Buono ed ordine");
        id = ordineDao.inserisciOrdine("mirko@gmail.com",50.0);
        ordineBean = ordineDao.doRetrieveByKey(id);
        dao.inserisciBuono(ordineBean,buonoregaloBean.getIdBuonoregalo());
    }

    @After
    public void tearDown() throws SQLException {
        System.out.println("Eliminazione buono ed ordine");
        ordineDao.eliminaOrdine(ordineBean.getIdOrdine());
        dao.eliminaBuono(buonoregaloBean.getIdBuonoregalo());

    }


    @Test
    public void TC_Stato_1() throws SQLException {
        System.out.println("Test1");
        String key = "kyzffgdfrg";
        boolean test = dao.cambioStato(key);
        assertTrue(test);
    }

    @Test
    public void TC_Stato_2() throws SQLException {
        System.out.println("Test1");
        String key = "12343gdf";
        boolean test = dao.cambioStato(key);
        assertFalse(test);
    }

}