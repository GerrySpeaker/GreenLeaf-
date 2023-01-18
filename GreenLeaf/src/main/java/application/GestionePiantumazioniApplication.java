package application;

import storage.AlberoDao;
import storage.IotDao;

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
        String ipv4 = request.getParameter("ipv4");
        String x,y,z;

        y = request.getParameter("longitudine");
        z = request.getParameter("altitudine");
        x = request.getParameter("latitudine");

        AlberoDao dao=new AlberoDao();
        IotDao iotDao = new IotDao();

        try {

            Boolean albero = dao.inserisciPiantumazione(id);
            Boolean iot = iotDao.inserisciIot(id, ipv4, x, y, z);

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
