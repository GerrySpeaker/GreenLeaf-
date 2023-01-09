package application;


import bean.AdminBean;
import bean.OperatoreBean;
import bean.UtenteBean;
import storage.AdminDao;
import storage.OperatoreDao;
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
    static OperatoreDao operatoreDao = new OperatoreDao();
    static AdminDao adminDao = new AdminDao();

    private UtenteBean bean= new UtenteBean();
    private UtenteBean user = new UtenteBean();
    private OperatoreBean operatore = new OperatoreBean();
    private AdminBean adminBean = new AdminBean();

    public RegistrazioneApplication() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = (String) request.getAttribute("email");
        try {
            adminBean = adminDao.doRetrieveByEmail(email);
            if(adminBean.equals(null)){
                return; //non è un admin
            }else{
                System.out.println("l'admin con email " + email + " vuole creare un nuovo operatore");
                operatore = creaOperatore(request,response,email);
                System.out.println(operatore.toString());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


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

    public OperatoreBean creaOperatore(HttpServletRequest request, HttpServletResponse response, String email){
        OperatoreBean operatoreBean = new OperatoreBean();

        operatoreBean.setNomeOperatore(request.getParameter("nome"));
        operatoreBean.setCognomeOperatore(request.getParameter("cognome"));
        operatoreBean.setEmail(request.getParameter("email"));
        operatoreBean.setRegione(request.getParameter("regione"));
        operatoreBean.setPassword(request.getParameter("password"));
        operatoreBean.setAdminCreatore(email);
        return operatoreBean;

    }


}
