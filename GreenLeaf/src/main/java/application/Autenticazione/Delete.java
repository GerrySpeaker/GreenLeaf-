package application.Autenticazione;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.OperatoreBean;
import bean.UtenteBean;
import storage.OperatoreDao;
import storage.UtenteDao;


@WebServlet("/Delete")
public class Delete extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static UtenteDao utenteDao = new UtenteDao();
    static OperatoreDao operatoreDao = new OperatoreDao();


    public Delete() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        System.out.println("Sono all'interno della servelet elimina account");

        try {
            String mailUtente = (String) request.getSession().getAttribute("email"); //l'email dell'utente che si prende dalla sessione
            System.out.println(mailUtente);
            String mailOperatore = request.getParameter("emailOP"); //l'email che prendiamo da ajax quando l'admin vuole eliminare un account operatore
            System.out.println(mailOperatore);
            UtenteBean utente = utenteDao.doRetrieveByEmail(mailUtente);
            System.out.println("Utente letto: " + utente.toString());
            if(utente.getNomeUtente() != null){
                utenteDao.eliminaAccount(mailUtente);
                request.getSession().removeAttribute("email");
                request.getSession().removeAttribute("utente");
                request.getSession().removeAttribute("prodottiCart");
                request.getSession().removeAttribute("regione");
                request.getSession().removeAttribute("buonoregalo");
                request.getSession().removeAttribute("sconto");
                request.getSession().removeAttribute("chiavi");
                request.getSession().removeAttribute("controllo");
                response.sendRedirect(request.getContextPath() + "/homepage.jsp");

            }else{
                OperatoreBean operatore = operatoreDao.doRetrieveByEmail(mailOperatore);
                if(operatore != null){
                    operatoreDao.eliminaAccount(mailOperatore);
                    request.getSession().removeAttribute("operatore");
                    response.sendRedirect(request.getContextPath() + "/listaOperatori.jsp");
                }
            }


        } catch (Exception e) {

            response.sendRedirect(request.getContextPath() + "/error.jsp");
            e.printStackTrace();
        }
    }

}