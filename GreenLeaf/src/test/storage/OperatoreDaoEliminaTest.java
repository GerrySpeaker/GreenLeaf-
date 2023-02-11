package storage;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import bean.AdminBean;
import bean.OperatoreBean;
import java.sql.SQLException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * Questa classe permette di testare un OperatoreDaoElimina.
 **/
public class OperatoreDaoEliminaTest {

  static OperatoreDao op = new OperatoreDao();

  static AdminDao adminDao = new AdminDao();

  public AdminBean adminBean =
      new AdminBean("gerryspeaker@gmail.com", "GerrySpeker23", "Napolitano", "Francesco");

  public OperatoreBean operatoreBean =
      new OperatoreBean("michelaoperatrice@gmail.com", "MikyMouse", "Mikela", "Lombardo",
          "gerryspeaker@gmail.com", "Marche");


  /**
   * Inizializzazione.
   **/
  @Before
  public void setUp() throws SQLException {
    System.out.println("SetUp");
    adminDao.registrazione(adminBean);
    op.registrazione(operatoreBean);

  }

  /**
   * Terminazione.
   **/
  @After
  public void tearDown() throws SQLException {
    System.out.println("After");
    op.eliminaAccount(operatoreBean.getEmail());
    adminDao.eliminaAccount(adminBean.getEmail());
  }


  @Test
  public void tc_odt_ea_1() throws SQLException {
    System.out.println("Test1");
    String email = "michelaoperatrice@gmail.com";
    Boolean result = op.eliminaAccount(email);
    assertTrue(result);
  }

  @Test
  public void tc_odt_ea_2() throws SQLException {
    System.out.println("Test2");
    String email = "FrancescoGaro@gmail.com";
    Boolean result = op.eliminaAccount(email);
    assertFalse(result);
  }


}