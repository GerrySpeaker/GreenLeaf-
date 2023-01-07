package application;


import bean.UtenteBean;
import storage.UtenteDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

@WebServlet("/RegistrazioneApplication")
public class RegistrazioneApplication extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static UtenteDao dao= new UtenteDao();
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

        String data = request.getParameter("data");
        Date data1= null;
        data1 = Date.valueOf(data);
        bean.setDataNascita(data1);

        bean.setEmail(request.getParameter("email"));
        bean.setPassword(request.getParameter("password"));
        bean.setNomeUtente(request.getParameter("nome"));
        bean.setCognomeUtente(request.getParameter("cognome"));


        UtenteBean utenteLogin;

        try {
            utenteLogin = dao.doRetrieveByEmail(bean.getEmail());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            if ( (utenteLogin = dao.doRetrieveByEmail(bean.getEmail())).equals(null) )
                System.out.println("ciao");
                dao.doSave(bean);

        } catch (SQLException e) {

            response.sendRedirect(request.getContextPath()+"/login.jsp");
            e.printStackTrace();
            return;
        }

        System.out.println(bean.toString());

        response.sendRedirect(request.getContextPath()+"/login.jsp");


    }


}
