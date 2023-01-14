package application;

import bean.CategoriaBean;
import storage.AlberoDao;
import storage.CategoriaDao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

    @WebServlet("/FiltriCatalogo")
public class FiltriCatalogo extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public FiltriCatalogo() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String ordine = request.getParameter("ordine");
        String articoli = request.getParameter("articoli");
        String regione = request.getParameter("regione");

        CategoriaDao dao = new CategoriaDao();
        try {
             ArrayList<CategoriaBean> CatalogoFiltro = new ArrayList<CategoriaBean>();
             CatalogoFiltro = dao.doRetrieveAll();
             List<CategoriaBean> sortedList = CatalogoFiltro.stream().sorted(Comparator.comparing(CategoriaBean::getNomeCategoria).reversed()).collect(Collectors.toList());

             sortedList.forEach(System.out::println);
        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath() + "/error.jsp");
            throw new RuntimeException(e);

        }

        response.sendRedirect(request.getContextPath()+"/catalogo.jsp");

    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

}
