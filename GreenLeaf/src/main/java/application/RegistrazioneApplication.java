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
import java.util.regex.*;

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


        Boolean mail = Pattern.matches("^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$", request.getParameter("email"));
        Boolean pass = Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$", request.getParameter("password"));
        Boolean nome = Pattern.matches("^[A-Za-z]+$", request.getParameter("nome"));
        Boolean cognome = Pattern.matches("^[A-Za-z]+$", request.getParameter("cognome"));


        String data = request.getParameter("data");
        Date data1= null;
        data1 = Date.valueOf(data);
        bean.setDataNascita(data1);

        bean.setEmail(request.getParameter("email"));
        bean.setPassword(request.getParameter("password"));
        bean.setNomeUtente(request.getParameter("nome"));
        bean.setCognomeUtente(request.getParameter("cognome"));

        if(mail == false){
            response.sendRedirect(request.getContextPath() + "/registrazione.jsp?email=true");
        }
        if(pass == false){
            response.sendRedirect(request.getContextPath() + "/registrazione.jsp?pass=true");
        }
        if(nome == false){
            response.sendRedirect(request.getContextPath() + "/registrazione.jsp?nome=true");
        }
        if(cognome == false){
            response.sendRedirect(request.getContextPath() + "/registrazione.jsp?cognome=true");
        }


        UtenteBean utenteLogin;

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
