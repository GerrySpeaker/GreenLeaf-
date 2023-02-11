package storage;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import bean.AlberoBean;
import bean.CategoriaBean;
import bean.IotBean;
import bean.OperatoreBean;
import bean.OrdineBean;
import java.sql.SQLException;
import java.util.ArrayList;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * Questa classe permette di testare un OperatoreDao.
 **/
public class OperatoreDaoTest {
  static OperatoreDao dao = new OperatoreDao();
  static AlberoDao alberoDao = new AlberoDao();
  static OrdineDao ordineDao = new OrdineDao();
  //String email, String password, String nomeOperatore,
  // String cognomeOperatore, String adminCreatore, String regione
  public OperatoreBean operatoreBean =
      new OperatoreBean("testOperatore@gmail.com", "Operatore99", "Pablo", "Picasso",
          "vincenzocerciello02@gmail.com", "Calabria");
  public OrdineBean ordineBean = new OrdineBean();
  public CategoriaBean categoriaBean =
      new CategoriaBean("pesco", "-70kg", "un bellissimo albero", "risorse\\img\\pesco.jpg",
          50.0);
  public IotBean iot =
      new IotBean(60, "43.236.77.46", "40.490550288191216", "15.750347771858316", null,
          "Calabria",
          "Non usato");

  int id = 0;
  int idAlbero = 0;

  /**
   * Inizializzazione.
   **/
  @Before
  public void setUp() throws SQLException {
    System.out.println("Registrazione Operatore");
    dao.registrazione(operatoreBean);
    id = ordineDao.inserisciOrdine("mirko@gmail.com", 50.0);
    ordineBean = ordineDao.doRetrieveByKey(id);
    idAlbero = alberoDao.inserisciAlbero(categoriaBean, ordineBean, "Calabria", iot);
  }

  /**
   * Terminazione.
   **/
  @After
  public void tearDown() throws SQLException {
    System.out.println("Eliminazione Operatore");
    dao.eliminaAccount(operatoreBean.email);
    ordineDao.eliminaOrdine(ordineBean.getIdOrdine());

  }


  @Test
  public void tc_odt_vp_1() throws SQLException {
    System.out.println("Test1");
    ArrayList<AlberoBean> alberi = dao.visualizzaPiantumazioni(operatoreBean.getEmail());
    assertNotEquals(null, alberi);
  }

  @Test
  public void tc_odt_vp_2() throws SQLException {
    System.out.println("Test2");
    System.out.println("Test1");
    ArrayList<AlberoBean> alberi = dao.visualizzaPiantumazioni("GiggiBuffon@gmail.com");
    assertEquals(0, alberi.size());
  }

}