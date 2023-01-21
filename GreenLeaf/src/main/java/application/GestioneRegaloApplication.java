package application;

import bean.BuonoregaloBean;
import storage.BuonoRegaloDao;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Regalo")
public class GestioneRegaloApplication extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        BuonoRegaloDao dao =  new BuonoRegaloDao();

        int sconto = 0;

        String key = request.getParameter("buono");

        try {
            BuonoregaloBean buono = dao.RiscattaBuono(key);


            if (buono != null){
                sconto = sconto + 50;
                dao.CambioStato(key);
                request.getSession().setAttribute("sconto", sconto);
            }

            else{
                request.getSession().setAttribute("sconto", sconto);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath() + "/carrello.jsp");
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
