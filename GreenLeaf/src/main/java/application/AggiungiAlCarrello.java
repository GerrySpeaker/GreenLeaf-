package application;

import bean.BuonoregaloBean;
import bean.CategoriaBean;
import com.example.greenleaf.Servlet;
import storage.CategoriaDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AggiungiCarrello")
public class AggiungiAlCarrello extends HttpServlet {

    private static final long serialVersionUID = 1L;
    static CategoriaDao model=new CategoriaDao();
    static ArrayList<CategoriaBean> articoli = new ArrayList<CategoriaBean>();

    static ArrayList<String> regioni = new ArrayList<String>();

    static ArrayList<String> buono = new ArrayList<>();


    public AggiungiAlCarrello() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String categoria =  request.getParameter("categoria");
        String regione = request.getParameter("scelta");

        if(regione!=null){
            try {
                CategoriaBean product = model.doRetrieveByKeyAlbero(categoria);

                articoli.add(product);
                regioni.add(regione);
                request.getSession().setAttribute("prodottiCart", articoli);
                request.getSession().setAttribute("regione", regioni);
                response.sendRedirect(request.getContextPath() + "/carrello.jsp");

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        else if(regione==null) {

                buono.add("Buono");
                request.getSession().setAttribute("buonoregalo", buono);
                response.sendRedirect(request.getContextPath() + "/carrello.jsp");

        }



    }

}