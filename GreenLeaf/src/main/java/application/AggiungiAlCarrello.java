package application;

import bean.BuonoregaloBean;
import bean.CategoriaBean;
import storage.AdminDao;
import storage.CategoriaDao;
import storage.OperatoreDao;

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
    static AdminDao adminDao = new AdminDao();
    static OperatoreDao operatoreDao = new OperatoreDao();
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

        String mail = request.getParameter("email");
        String categoria =  request.getParameter("categoria");
        String regione = request.getParameter("scelta");

        int sconto = 0;
        request.getSession().setAttribute("sconto",sconto);

        try{
            if(adminDao.doRetrieveByEmail(mail)== null){
                response.sendRedirect(request.getContextPath() + "/homepage.jsp");
            }
            if(operatoreDao.doRetrieveByEmail(mail)== null){
                response.sendRedirect(request.getContextPath() + "/homepage.jsp");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        if(regione!=null){
            try {
                CategoriaBean product = model.doRetrieveByKeyAlbero(categoria);
                articoli.add(product);
                regioni.add(regione);
                request.getSession().setAttribute("prodottiCart", articoli);
                request.getSession().setAttribute("regione", regioni);
                request.getSession().setAttribute("buonoregalo", buono);
                response.sendRedirect(request.getContextPath() + "/catalogo.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(regione==null) {

                buono.add("Buono");
                request.getSession().setAttribute("prodottiCart", articoli);
                request.getSession().setAttribute("regione", regioni);
                request.getSession().setAttribute("buonoregalo", buono);
                response.sendRedirect(request.getContextPath() + "/catalogo.jsp");

        }

    }

}