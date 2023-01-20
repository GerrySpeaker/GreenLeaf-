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

        String data = request.getParameter("data");
        Date data1= null;
        data1 = Date.valueOf(data);
        bean.setDataNascita(data1);


        bean.setEmail(request.getParameter("email"));
        bean.setPassword(request.getParameter("password"));
        bean.setNomeUtente(request.getParameter("nome"));
        bean.setCognomeUtente(request.getParameter("cognome"));


        UtenteBean utenteLogin;
        if(!bean.getEmail().contains("@")) {
            response.sendRedirect(request.getContextPath() + "/registrazione.jsp?error=true");
        }

        else {
            try {
                utenteLogin = dao.doRetrieveByEmail(bean.getEmail());
                adminBean = adminDao.doRetrieveByEmail(bean.getEmail());
                operatore = operatoreDao.doRetrieveByEmail(bean.getEmail());
                if (utenteLogin.getNomeUtente() == null && adminBean.getNomeAdmin() == null && operatore.getNomeOperatore() == null) {
                    dao.registrazione(bean);
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                }
                else{
                    response.sendRedirect(request.getContextPath() + "/login.jsp?check=true");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        }
    }


}
