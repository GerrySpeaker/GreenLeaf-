package application.gestionipiantumazioni;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import storage.AlberoDao;

/**
 * Questa classe permette di gestire le operazioni relative alla piantumazione.
 **/
@WebServlet("/AlberiPiantumati")
public class GestionePiantumazioniApplication extends HttpServlet {

  public GestionePiantumazioniApplication() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {


    Integer id = Integer.parseInt(request.getParameter("idAlberoDaPiantare"));

    AlberoDao dao = new AlberoDao();

    try {

      Boolean albero = dao.inserisciPiantumazione(id);
      response.sendRedirect(
          request.getContextPath()
              + "/visualizzaAlberoDaPiantare.jsp?idAlberoDaPiantare="
              + id
              + "&piantato=true");

    } catch (Exception e) {
      response.sendRedirect(request.getContextPath() + "/error.jsp");
      throw new RuntimeException(e);
    }


  }


  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

}
