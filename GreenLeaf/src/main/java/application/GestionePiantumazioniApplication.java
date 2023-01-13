package application;

import storage.AlberoDao;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AlberiPiantumati")
public class GestionePiantumazioniApplication extends HttpServlet{

    public GestionePiantumazioniApplication() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        System.out.println("Sono nella do get del albero da piantumare");

        Integer id = Integer.parseInt(request.getParameter("idAlberoDaPiantare"));

        AlberoDao dao=new AlberoDao();
        try {

            Boolean albero = dao.inserisciPiantumazione(id);

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath()+"/visualizzaAlberoDaPiantare.jsp?idAlberoDaPiantare="+id+"&piantato=true");

    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
