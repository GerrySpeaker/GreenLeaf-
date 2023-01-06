package application;


import bean.UtenteBean;
import storage.UtenteDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Registrazione")
public class RegistrazioneApplication extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static UtenteDao dao= null;
    private UtenteBean bean= new UtenteBean();
    private UtenteBean user = new UtenteBean();

    public RegistrazioneApplication() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("richiamata la doPost");



        bean.setEmail(request.getParameter("email"));
        bean.setPassword(request.getParameter("password"));
        bean.setNomeUtente(request.getParameter("nome"));
        bean.setCognomeUtente(request.getParameter("cognome"));
        bean.setDataNascita(new Date(2001,01,01));


        UtenteBean utenteLogin;
        try {
            utenteLogin = dao.doRetrieveByEmail(bean.getEmail());
        } catch (SQLException e) {

            response.sendRedirect(request.getContextPath()+"/login.jsp");
            e.printStackTrace();
            return;
        }

        System.out.println(bean.toString());

        try {
            dao.doSave(bean);

        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            e.printStackTrace();
            return;
        }


        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }
}
