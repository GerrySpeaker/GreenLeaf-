package application;


import java.io.IOException;
import bean.AdminBean;
import bean.OperatoreBean;
import storage.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/CreaOperatoreApplication")
public class CreaOperatoreApplication {

    static OperatoreBean operatoreBean = new OperatoreBean();
    private AdminBean adminBean = new AdminBean();
    private AdminDao adminDao = new AdminDao();

    public CreaOperatoreApplication() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("porcodio");
        String email = (String) request.getAttribute("email");
        try {
            adminBean = adminDao.doRetrieveByEmail(email);
            if(adminBean.equals(null)){
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }else{
                operatoreBean.setNomeOperatore(request.getParameter("nome"));
                operatoreBean.setCognomeOperatore(request.getParameter("cognome"));
                operatoreBean.setEmail(request.getParameter("email"));
                operatoreBean.setRegione(request.getParameter("regione"));
                operatoreBean.setPassword(request.getParameter("password"));
                operatoreBean.setAdminCreatore(email);
                System.out.println("l'admin con email " + email + " vuole creare un nuovo operatore");
                System.out.println(operatoreBean.toString());
                response.sendRedirect(request.getContextPath()+"/home.jsp");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}

