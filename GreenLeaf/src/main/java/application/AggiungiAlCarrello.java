package application;

import bean.AlberoBean;
import bean.CategoriaBean;
import storage.AlberoDao;
import storage.CategoriaDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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


    public AggiungiAlCarrello() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        /*Integer count = (Integer) request.getSession().getAttribute("count"); da vedere se mettere
        if(count == null)
        {
            count = 0;
        }*/
        System.out.println("Sono nell'aggiunta al carrello");
        String categoria =  request.getParameter("categoria");
        String regione = request.getParameter("scelta");

        System.out.println(categoria + regione);
        try {
              CategoriaBean product = model.doRetrieveByKeyAlbero(categoria);

              /*count++;
              request.getSession().setAttribute("count", count);*/
              articoli.add(product);
              request.getSession().setAttribute("prodottiCart", articoli);

        } catch (SQLException e) {
            e.printStackTrace();
        }



    }

}