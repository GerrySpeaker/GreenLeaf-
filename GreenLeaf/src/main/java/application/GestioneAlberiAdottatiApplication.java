package application;

import bean.AlberoBean;
import storage.AlberoDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AlberiAdottati")
public class GestioneAlberiAdottatiApplication extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public GestioneAlberiAdottatiApplication() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        System.out.println("Sono nella do get del albero adottato");
        AlberoDao dao=new AlberoDao();

        Integer id = Integer.parseInt(request.getParameter("idAlbero"));

        try {

                AlberoBean albero = dao.doRetrieveByKey(id);
                ServletContext cxt= getServletContext();
                cxt.setAttribute("albero", albero);

                response.sendRedirect(request.getContextPath()+"/visualizzaAlberoAdottato.jsp");

            } catch (SQLException e) {
                throw new RuntimeException(e);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
