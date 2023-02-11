package application.GestioneAlberiDaAdottare;

import bean.AssociatoBean;
import bean.CategoriaBean;
import bean.UtenteBean;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Mockito;
import storage.AssociatoDao;
import storage.UtenteDao;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class AggiungiAlCarrelloTest extends Mockito{

    private static final HttpServletRequest httpServletRequest = Mockito.mock(HttpServletRequest.class);
    private static final HttpServletResponse httpServletResponse = Mockito.mock(HttpServletResponse.class);

    private static final HttpSession session = Mockito.mock(HttpSession.class);


    static UtenteDao dao= new UtenteDao();

    static AssociatoDao associatoDao = new AssociatoDao();
    public UtenteBean utenteBean=new UtenteBean("test6@gmail.com","Angelo99","Afeltra","Angelo", Date.valueOf("2021-01-14"));
    AggiungiAlCarrello test = new AggiungiAlCarrello();
    ArgumentCaptor<String> captor = ArgumentCaptor.forClass(String.class);

    public CategoriaBean categoriaBean = new CategoriaBean("pesco","-70kg","un bellissimo albero","risorse\\img\\pesco.jpg",50.0);

    ArrayList<AssociatoBean> associati;

    {
        try {
            associati = (ArrayList<AssociatoBean>) associatoDao.doRetrieveAlbero(categoriaBean.getNomeCategoria());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


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
    public void TC_AACT_1() throws ServletException, IOException {

        System.out.println("test1");
        when(httpServletRequest.getSession()).thenReturn(session);
        when(httpServletRequest.getParameter("email")).thenReturn("test6@gmail.com");
        when(httpServletRequest.getParameter("scelta")).thenReturn(associati.get(1).getRegioneAssociato());
        when(httpServletRequest.getParameter("categoria")).thenReturn(categoriaBean.getNomeCategoria());
        when(httpServletRequest.getContextPath()).thenReturn("http://localhost:8080/GreenLeaf_war_exploded");
        test.doPost(httpServletRequest,httpServletResponse);

        verify(httpServletResponse,times(1)).sendRedirect(captor.capture());
        assertEquals("http://localhost:8080/GreenLeaf_war_exploded/catalogo.jsp", captor.getValue());

    }


    @Test
    public void TC_AACT_2() throws ServletException, IOException {

        when(httpServletRequest.getSession()).thenReturn(session);
        when(httpServletRequest.getParameter("email")).thenReturn("test6@gmail.com");
        when(httpServletRequest.getParameter("scelta")).thenReturn("Lazio");
        when(httpServletRequest.getParameter("categoria")).thenReturn(categoriaBean.getNomeCategoria());
        when(httpServletRequest.getContextPath()).thenReturn("http://localhost:8080/GreenLeaf_war_exploded");
        test.doPost(httpServletRequest,httpServletResponse);

        verify(httpServletResponse,times(2)).sendRedirect(captor.capture());
        assertEquals("http://localhost:8080/GreenLeaf_war_exploded/homepage.jsp", captor.getValue());
    }



}
