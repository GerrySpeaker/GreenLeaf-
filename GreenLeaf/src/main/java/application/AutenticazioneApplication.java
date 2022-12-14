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

@WebServlet("/AutenticazioneApplication")
public class AutenticazioneApplication extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static UtenteDao utenteDao= new UtenteDao();
    static AdminDao adminDao = new AdminDao();
    static OperatoreDao operatoreDao = new OperatoreDao();
    private UtenteBean bean= new UtenteBean();
    private UtenteBean user = new UtenteBean();

    public AutenticazioneApplication() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean admin = false;
        Boolean operatore = false;

        System.out.println("richiamata la doPost del login");

        String email = request.getParameter("email");
        String pass = request.getParameter("password");



        UtenteBean utenteLogin;
        AdminBean adminLogin;
        OperatoreBean operatoreLogin;


        try {
            utenteLogin = utenteDao.login(email,pass);

            if(utenteLogin == null){
                adminLogin = adminDao.login(email, pass);


                if(adminLogin == null){

                    operatoreLogin = operatoreDao.login(email, pass);

                    if(operatoreLogin == null){

                        response.sendRedirect(request.getContextPath() + "/login.jsp");
                    }
                    else{
                            operatore = true;
                            System.out.println("accesso consentito");
                            request.getSession().setAttribute("email", email);
                            request.getSession().setAttribute("operatore", operatore);
                            response.sendRedirect(request.getContextPath() + "/homeopearatore.jsp");
                    }
                }
                else{
                        admin = true;
                        System.out.println("accesso consentito");
                        request.getSession().setAttribute("email", email);
                        request.getSession().setAttribute("adminRoles", admin);
                        response.sendRedirect(request.getContextPath() + "/homeadmin.jsp");

                }
            }
            else{
                    System.out.println("accesso consentito");
                    request.getSession().setAttribute("email", email);
                    response.sendRedirect(request.getContextPath() + "/homeutente.jsp");

            }

        } catch (Exception e) {


            response.sendRedirect(request.getContextPath() + "/error.jsp");

            throw new RuntimeException(e);
        }


    }


}
