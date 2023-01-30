package storage;

import bean.UtenteBean;
import org.junit.jupiter.api.*;
import javax.naming.NamingException;
import java.sql.*;
import java.util.Date;

class UtenteDaoTest {

    UtenteDao utenteDao = new UtenteDao();
    UtenteBean utenteBean = new UtenteBean("testgf@gmail.com","Password1","Afeltra","Roberto",new Date(1999,01,01));

    UtenteDaoTest() throws NamingException {
    }

    @BeforeEach
    public void Inizializzazione() throws SQLException{

        utenteDao.registrazione(utenteBean);
    }

    @Test
    public void testLogin() throws SQLException {
        String email = "testgf@gmail.com";
        String pass = "Password1";

        //UtenteBean loginTest = utenteDao.login(email,pass);
        //assertEquals(email,loginTest.getEmail());
    }
    /*
    @BeforeAll
    public void clear() throws SQLException {
        utenteDao.eliminaAccount(utenteBean.getEmail());
    }

*/



}