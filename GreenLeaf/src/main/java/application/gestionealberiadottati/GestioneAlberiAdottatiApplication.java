package application.gestionealberiadottati;

import bean.AlberoBean;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import storage.AlberoDao;

/**
 * Questa classe permette di gestire le operazioni relative agli alberi già adottati.
 **/
@WebServlet("/AlberiAdottati")
public class GestioneAlberiAdottatiApplication extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public GestioneAlberiAdottatiApplication() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    System.out.println("Sono nella do get del albero adottato");

    Integer id = Integer.parseInt(request.getParameter("idAlbero"));
    System.out.println(id);
    AlberoDao dao = new AlberoDao();
    try {

      AlberoBean albero = dao.doRetrieveByKey(id);
      ServletContext cxt = getServletContext();
      cxt.setAttribute("albero", albero);

    } catch (Exception e) {
      response.sendRedirect(request.getContextPath() + "/error.jsp");
      throw new RuntimeException(e);
    }
    response.sendRedirect(request.getContextPath() + "/visualizzaAlberoAdottato.jsp");

  }


  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }

}
