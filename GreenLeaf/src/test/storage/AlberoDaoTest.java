package storage;


import bean.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.internal.matchers.Or;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

public class AlberoDaoTest{
    static AlberoDao dao= new AlberoDao();
    static OrdineDao ordineDao = new OrdineDao();
    public OrdineBean ordineBean = new OrdineBean();
    public CategoriaBean categoriaBean = new CategoriaBean("pesco","-70kg","un bellissimo albero","risorse\\img\\pesco.jpg",50.0);
    public IotBean iot = new IotBean(60,"43.236.77.46","40.490550288191216","15.750347771858316",null,"Calabria","Non usato");

    @Before
    public void setUp() throws SQLException {
        System.out.println("Registrazione Buono e albero");
        ordineDao.inserisciOrdine("mirko@gmail.com",50.0);
        ordineBean = ordineDao.doRetrieveByKey(24);
        dao.inserisciAlbero(categoriaBean,ordineBean,"Calabria",iot);
    }

    @After
    public void tearDown() throws SQLException {
        System.out.println("Eliminazione buono ed albero");
        ordineDao.eliminaOrdine(ordineBean.getIdOrdine());
    }


    @Test
    public void TC_Piantumazione_1() throws SQLException {
        System.out.println("Test1");
        AlberoBean alberoBean = dao.doRetrieveByKey(35);
        boolean test = dao.inserisciPiantumazione(alberoBean.getIdAlbero());
        assertTrue(test);
    }

    @Test
    public void TC_Piantumazione_2() throws SQLException {
        System.out.println("Test1");
        boolean test = dao.inserisciPiantumazione(88);
        assertFalse(test);
    }


}