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

        AlberoDao dao=new AlberoDao();
        try{
            ServletContext cxt= getServletContext();
            ArrayList<AlberoBean> alberi=(ArrayList<AlberoBean>) dao.doRetrieveAll();
            cxt.setAttribute("alberi", alberi);

            response.sendRedirect(request.getContextPath()+"/alberiAdottati.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
