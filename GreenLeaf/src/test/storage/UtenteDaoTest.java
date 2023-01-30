package storage;

import bean.UtenteBean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


import java.sql.Date;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

public class UtenteDaoTest {
    static UtenteDao dao= new UtenteDao();
    public UtenteBean utenteBean=new UtenteBean("test6@gmail.com","Angelo99","Afeltra","Angelo", Date.valueOf("2021-01-14"));


    @Before
    public void setUp() throws SQLException {
        System.out.println("SetUp");
        dao.registrazione(utenteBean);
    }

    @After
    public void tearDown() throws SQLException {
        System.out.println("After");
        dao.eliminaAccount(utenteBean.email);

    }


   @Test
    public void TC_Login_1() throws SQLException {
        System.out.println("Test1");
        String email="test6@gmail.com";
        String pass="Angelo99";
        UtenteBean utenteLogin=dao.login(email,pass);
        assertEquals(email,utenteLogin.getEmail());
    }

    @Test
    public void TC_Login_2() throws SQLException {
        System.out.println("Test2");
        String email="test6@gmail.com";
        String pass="Angelo";
        UtenteBean utenteLogin=dao.login(email,pass);
        assertEquals(null,utenteLogin);
    }

    @Test
    public void TC_Login_3() throws SQLException {
        System.out.println("Test3");
        String email="testolo@gmail.com";
        String pass="Angelo";
        UtenteBean utenteLogin=dao.login(email,pass);
        assertEquals(null,utenteLogin);
    }

}