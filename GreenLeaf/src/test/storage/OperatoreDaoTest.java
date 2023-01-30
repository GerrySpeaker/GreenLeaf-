package storage;

import bean.OperatoreBean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


import java.sql.Date;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

public class OperatoreDaoTest {
    static OperatoreDao dao= new OperatoreDao();

    //String email, String password, String nomeOperatore, String cognomeOperatore, String adminCreatore, String regione
    public OperatoreBean operatoreBean= new OperatoreBean("testOperatore@gmail.com","Operatore99","Pablo","Picasso","vincenzocerciello02@gmail.com","Campania");


    @Before
    public void setUp() throws SQLException {
        System.out.println("Registrazione Operatore");
        dao.registrazione(operatoreBean);
    }

    @After
    public void tearDown() throws SQLException {
        System.out.println("Eliminazione Operatore");
        dao.eliminaAccount(operatoreBean.email);

    }


    @Test
    public void TC_O_Login_1() throws SQLException {
        System.out.println("Test1");
        String email="testOperatore@gmail.com";
        String pass="Operatore99";
        OperatoreBean operatoreLogin = dao.login(email,pass);
        assertEquals(email,operatoreLogin.getEmail());
    }

    @Test
    public void TC_O_Login_2() throws SQLException {
        System.out.println("Test2");
        String email="testOperatore@gmail.com";
        String pass="Operatore";
        OperatoreBean operatoreLogin =dao.login(email,pass);
        assertEquals(null,operatoreLogin);
    }

    @Test
    public void TC_O_Login_3() throws SQLException {
        System.out.println("Test3");
        String email="testOperatore@gmail.com";
        String pass="Operatore1";
        OperatoreBean operatoreLogin =dao.login(email,pass);
        assertEquals(null,operatoreLogin);
    }

}