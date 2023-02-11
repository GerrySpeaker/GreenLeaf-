package storage;

import bean.AdminBean;
import bean.OperatoreBean;
import bean.UtenteBean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


import java.sql.Date;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

public class OperatoreDaoEliminaTest {

    static OperatoreDao op = new OperatoreDao();

    static AdminDao adminDao = new AdminDao();

    public AdminBean adminBean = new AdminBean("gerryspeaker@gmail.com","GerrySpeker23","Napolitano","Francesco");

    public OperatoreBean operatoreBean = new OperatoreBean("michelaoperatrice@gmail.com","MikyMouse","Mikela","Lombardo","gerryspeaker@gmail.com","Marche");


    @Before
    public void setUp() throws SQLException {
        System.out.println("SetUp");
        adminDao.registrazione(adminBean);
        op.registrazione(operatoreBean);

    }

    @After
    public void tearDown() throws SQLException {
        System.out.println("After");
        op.eliminaAccount(operatoreBean.getEmail());
        adminDao.eliminaAccount(adminBean.getEmail());
    }


   @Test
    public void TC_ODT_EA_1() throws SQLException {
        System.out.println("Test1");
        String email="michelaoperatrice@gmail.com";
        Boolean result = op.eliminaAccount(email);
        assertTrue(result);
    }

    @Test
    public void TC_ODT_EA_2() throws SQLException {
        System.out.println("Test2");
        String email="FrancescoGaro@gmail.com";
        Boolean result = op.eliminaAccount(email);
        assertFalse(result);
    }


}