package application;


import bean.CategoriaBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

@WebServlet("/RimuoviDalCarrello")
public class RimuoviDalCarrello extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String categoria = request.getParameter("categoria");

        if(categoria.equals("buono")){
            ArrayList<String> buono = (ArrayList<String>) request.getSession().getAttribute("buonoregalo");
            for(int i = 0; i<1; i++){
                buono.remove(i);
            }
            request.getSession().setAttribute("buonoregalo",buono);
        }else {
            ArrayList<CategoriaBean> articoli = (ArrayList<CategoriaBean>) request.getSession().getAttribute("prodottiCart");
            Iterator<CategoriaBean> prodotti = articoli.iterator();
            ArrayList<String> regioni =  (ArrayList<String>) request.getSession().getAttribute("regione");
            int i = 0;

            while (prodotti.hasNext()) {
                CategoriaBean prod = prodotti.next();
                if (prod.getNomeCategoria().equals(categoria)) {
                    prodotti.remove();
                    regioni.remove(i);
                    break;
                }
                i++;
            }
            request.getSession().setAttribute("prodottiCart", articoli);
            request.getSession().setAttribute("regione", regioni);
        }

        response.sendRedirect(request.getContextPath()+"/carrello.jsp");

    }

}
