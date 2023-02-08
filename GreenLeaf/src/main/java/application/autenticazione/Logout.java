package application.autenticazione;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import bean.ProdottoBean;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public Logout() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    System.out.println("sono nel logout");
    ServletContext cxt = getServletContext();
    cxt.removeAttribute("adminRoles");
    cxt.removeAttribute("utente");
    cxt.removeAttribute("operatore");
    cxt.removeAttribute("email");
    request.getSession().removeAttribute("adminRoles");
    request.getSession().removeAttribute("email");
    request.getSession().removeAttribute("utente");
    request.getSession().removeAttribute("operatore");
    request.getSession().removeAttribute("prodottiCart");
    request.getSession().removeAttribute("regione");
    request.getSession().removeAttribute("buonoregalo");
    request.getSession().removeAttribute("sconto");
    request.getSession().removeAttribute("chiavi");
    request.getSession().removeAttribute("controllo");
    request.getSession().invalidate();
    response.sendRedirect(request.getContextPath() + "/homepage.jsp");


  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}