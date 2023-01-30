package application;

import bean.UtenteBean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import storage.UtenteDao;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.*;

public class AutenticazioneApplicationTest extends Mockito {

    private static final HttpServletRequest httpServletRequest = Mockito.mock(HttpServletRequest.class);
    private static final HttpServletResponse httpServletResponse = Mockito.mock(HttpServletResponse.class);

    private static final HttpSession session = Mockito.mock(HttpSession.class);


    static UtenteDao dao= new UtenteDao();
    public UtenteBean utenteBean=new UtenteBean("test6@gmail.com","Angelo99","Afeltra","Angelo", Date.valueOf("2021-01-14"));
    AutenticazioneApplication test = new AutenticazioneApplication();
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);

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
    public void TestServelet_1() throws ServletException, IOException {

        System.out.println("test1");
        when(httpServletRequest.getSession()).thenReturn(session);
        when(httpServletRequest.getParameter("email")).thenReturn("test6@gmail.com");
        when(httpServletRequest.getParameter("password")).thenReturn("Angelo99");
        when(httpServletRequest.getContextPath()).thenReturn("http://localhost:8080/GreenLeaf_war_exploded");
        test.doPost(httpServletRequest,httpServletResponse);

        verify(httpServletResponse,times(1)).sendRedirect(captor.capture());
        assertEquals("http://localhost:8080/GreenLeaf_war_exploded/utente.jsp", captor.getValue());

    }


    @Test
    public void TestServele_2() throws ServletException, IOException {


        System.out.println("test2");
        when(httpServletRequest.getSession()).thenReturn(session);
        when(httpServletRequest.getParameter("email")).thenReturn("test6@gmail.com");
        when(httpServletRequest.getParameter("password")).thenReturn("Angelo");
        when(httpServletRequest.getContextPath()).thenReturn("http://localhost:8080/GreenLeaf_war_exploded");
        test.doPost(httpServletRequest,httpServletResponse);

        verify(httpServletResponse,times(2)).sendRedirect(captor.capture());
        assertEquals("http://localhost:8080/GreenLeaf_war_exploded/login.jsp?errore=true", captor.getValue());

    }

    @Test
    public void TestServele_3() throws ServletException, IOException {

        System.out.println("test3");
        when(httpServletRequest.getSession()).thenReturn(session);
        when(httpServletRequest.getParameter("email")).thenReturn("tes6@gmail.com");
        when(httpServletRequest.getParameter("password")).thenReturn("Angelo");
        when(httpServletRequest.getContextPath()).thenReturn("http://localhost:8080/GreenLeaf_war_exploded");
        test.doPost(httpServletRequest,httpServletResponse);

        verify(httpServletResponse,times(3)).sendRedirect(captor.capture());
        assertEquals("http://localhost:8080/GreenLeaf_war_exploded/login.jsp?errore=true", captor.getValue());

    }


}