package storage;

import bean.*;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class OperatoreDaoTest {
    static OperatoreDao dao= new OperatoreDao();

    //String email, String password, String nomeOperatore, String cognomeOperatore, String adminCreatore, String regione
    public OperatoreBean operatoreBean= new OperatoreBean("testOperatore@gmail.com","Operatore99","Pablo","Picasso","vincenzocerciello02@gmail.com","Calabria");

    static AlberoDao alberoDao= new AlberoDao();
    static OrdineDao ordineDao = new OrdineDao();
    public OrdineBean ordineBean = new OrdineBean();
    public CategoriaBean categoriaBean = new CategoriaBean("pesco","-70kg","un bellissimo albero","risorse\\img\\pesco.jpg",50.0);
    public IotBean iot = new IotBean(60,"43.236.77.46","40.490550288191216","15.750347771858316",null,"Calabria","Non usato");

    int id = 0;
    int idAlbero = 0;

    @Before
    public void setUp() throws SQLException {
        System.out.println("Registrazione Operatore");
        dao.registrazione(operatoreBean);
        id = ordineDao.inserisciOrdine("mirko@gmail.com",50.0);
        ordineBean = ordineDao.doRetrieveByKey(id);
        idAlbero = alberoDao.inserisciAlbero(categoriaBean,ordineBean,"Calabria",iot);
    }

    @After
    public void tearDown() throws SQLException {
        System.out.println("Eliminazione Operatore");
        dao.eliminaAccount(operatoreBean.email);
        ordineDao.eliminaOrdine(ordineBean.getIdOrdine());

    }


    @Test
    public void TC_PA_1() throws SQLException {
        System.out.println("Test1");
        ArrayList<AlberoBean> alberi = dao.visualizzaPiantumazioni(operatoreBean.getEmail());
        assertNotEquals(null,alberi);
    }

    @Test
    public void TC_PA_2() throws SQLException {
        System.out.println("Test2");
        System.out.println("Test1");
        ArrayList<AlberoBean> alberi = dao.visualizzaPiantumazioni("GiggiBuffon@gmail.com");
        assertEquals(0,alberi.size());
    }

}