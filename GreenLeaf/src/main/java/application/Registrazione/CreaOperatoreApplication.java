package application.Registrazione;


import java.io.IOException;
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
import java.sql.SQLException;
import java.util.regex.Pattern;

@WebServlet("/CreaOperatoreApplication")
public class CreaOperatoreApplication extends HttpServlet {

    private static final long serialVersionUID = 1L;

    static OperatoreBean operatoreBean = new OperatoreBean();
    static OperatoreBean check = new OperatoreBean();
    private AdminBean adminBean = new AdminBean();
    private AdminBean admin = new AdminBean();
    private AdminDao adminDao = new AdminDao();

    private OperatoreDao operatoreDao = new OperatoreDao();
    public CreaOperatoreApplication() {
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

        UtenteBean utenteLogin = new UtenteBean();
        UtenteDao dao = new UtenteDao();
        String email = (String) request.getSession().getAttribute("email");
        String regione = request.getParameter("regione");

        if(regione.equals("Regioni")){
            response.sendRedirect(request.getContextPath() + "/newOperatore.jsp?errorereg=true");
        }
        else {
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
            try {
                utenteLogin = dao.doRetrieveByEmail(request.getParameter("email"));
                admin = adminDao.doRetrieveByEmail(email);
                check = operatoreDao.doRetrieveByEmail(request.getParameter("email"));
                adminBean = adminDao.doRetrieveByEmail(request.getParameter("email"));
                if (admin.getEmail() != null) {
                    if (utenteLogin.getEmail() == null && adminBean.getEmail() == null && check.getEmail() == null) {
                        operatoreBean.setNomeOperatore(request.getParameter("nome"));
                        operatoreBean.setCognomeOperatore(request.getParameter("cognome"));
                        operatoreBean.setEmail(request.getParameter("email"));
                        operatoreBean.setRegione(regione);
                        operatoreBean.setPassword(request.getParameter("password"));
                        operatoreBean.setAdminCreatore(email);

                        operatoreDao.registrazione(operatoreBean);
                        response.sendRedirect(request.getContextPath() + "/listaOperatori.jsp");

                    } else {
                            response.sendRedirect(request.getContextPath() + "/newOperatore.jsp?errore=true");
                    }


                } else {
                    response.sendRedirect(request.getContextPath() + "/login.jsp");

                }
            } catch (Exception e) {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                throw new RuntimeException(e);

            }
        }
    }


}

