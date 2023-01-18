package application;


import java.io.IOException;
import bean.AdminBean;
import bean.OperatoreBean;
import storage.AdminDao;
import storage.OperatoreDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/CreaOperatoreApplication")
public class CreaOperatoreApplication extends HttpServlet {

    private static final long serialVersionUID = 1L;

    static OperatoreBean operatoreBean = new OperatoreBean();
    static OperatoreBean check = new OperatoreBean();
    private AdminBean adminBean = new AdminBean();
    private AdminDao adminDao = new AdminDao();

    private OperatoreDao operatore = new OperatoreDao();
    public CreaOperatoreApplication() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String email = (String) request.getSession().getAttribute("email");
        String regione = request.getParameter("regione");
        System.out.println(regione);
        if(regione.equals("Regioni")){
            response.sendRedirect(request.getContextPath() + "/newOperatore.jsp?errorereg=true");
        }
        else {
            try {
                adminBean = adminDao.doRetrieveByEmail(email);
                if (adminBean.getEmail() != null) {

                    operatoreBean.setNomeOperatore(request.getParameter("nome"));
                    operatoreBean.setCognomeOperatore(request.getParameter("cognome"));
                    operatoreBean.setEmail(request.getParameter("email"));
                    operatoreBean.setRegione(regione);
                    operatoreBean.setPassword(request.getParameter("password"));
                    operatoreBean.setAdminCreatore(email);
                    System.out.println("l'admin con email " + email + " vuole creare un nuovo operatore");
                    System.out.println(operatoreBean.toString());

                    if (!operatoreBean.getEmail().contains("@")) {
                        response.sendRedirect(request.getContextPath() + "/newOperatore.jsp?error=true");
                    } else {
                        check = operatore.doRetrieveByEmail(operatoreBean.getEmail());
                        System.out.println("l'operato letto dal database con la stessa mail:");
                        System.out.println(check.toString());
                        if (check.getNomeOperatore() == null) {
                            operatore.registrazione(operatoreBean);
                            response.sendRedirect(request.getContextPath() + "/admin.jsp");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/newOperatore.jsp?errore=true");
                        }
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

