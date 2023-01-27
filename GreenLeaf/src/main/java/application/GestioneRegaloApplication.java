package application;

import bean.BuonoregaloBean;
import storage.BuonoRegaloDao;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Regalo")
public class GestioneRegaloApplication extends HttpServlet{

    int sconto = 0;
    ArrayList<String> controllo = new ArrayList<>();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        BuonoRegaloDao dao =  new BuonoRegaloDao();
        int i = 0;
        sconto = (int) request.getSession().getAttribute("sconto");

        String key = request.getParameter("buono");


        if(controllo.size()>0){
            while(i<controllo.size()){
                if (key.equals(controllo.get(i))){
                    response.sendRedirect(request.getContextPath() + "/carrello.jsp?check=true");
                    return;
                }
                i++;
            }
        }

        try {
            BuonoregaloBean buono = dao.RiscattaBuono(key);
            if(buono!=null) {
                if (buono.getStato().equals("Da riscattare")){
                    controllo.add(key);
                    request.getSession().setAttribute("controllo", controllo);
                    sconto = sconto + 50;
                    request.getSession().setAttribute("sconto", sconto);
                }
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
