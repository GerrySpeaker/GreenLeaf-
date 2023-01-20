<%@ page import="bean.AlberoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="storage.OperatoreDao" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="storage.CategoriaDao" %>
<%@ page import="bean.CategoriaBean" %>
<%@ page import="storage.AlberoDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dettaglio al prodotto OPERATORE</title>
  <link rel="stylesheet" href="risorse/style/prodotto.css">
  <link rel="stylesheet" href="risorse/style/checkbox.css">
    <link rel="stylesheet" href="risorse/style/iot.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>

<%@ include file="header.jsp" %>
<%
    String operatore = session.getAttribute("operatore").toString();
    if(operatore == null)
    {
      response.sendRedirect(request.getContextPath()+"/error.jsp");
      return;
    }

    AlberoDao dao=new AlberoDao();



    Integer id = Integer.parseInt(request.getParameter("idAlberoDaPiantare"));
    System.out.println(id);
    AlberoBean albero = dao.doRetrieveByKey(id);

    if(albero == null){
      response.sendRedirect(request.getContextPath()+"/alberiPiantumati.jsp");
    }

    CategoriaDao cdao = new CategoriaDao();

    CategoriaBean cbean = cdao.doRetrieveByKeyAlbero(albero.getCategoria());

    System.out.println(cbean.toString());

    System.out.println("sono nelle jsp");

%>
<div class="all-datail" id="albero">
  <div class = "card-wrapper">
    <div class = "card">
      <!-- card left -->
      <div class = "product-imgs">
        <div class = "img-display">
          <div class = "img-showcase">
            <img src = "<%= cbean.getUrl()%>"><!-- inserire url categoria albero -->
          </div>
        </div>
      </div>
      <!-- card right -->
      <div class = "product-content">
        <h2 class = "product-title"><%= albero.getIdAlbero()%></h2><!-- id albero -->
        <hr>

        <div class = "product-detail">
          <p><span>Categoria</span>: <%= albero.getCategoria()%></p>
          <p><span>Co2</span>: <%= albero.getCo2()%></p>
          <p><span>Stato</span>: <%= albero.getStato()%></p>
        </div>

          <div class="iot">
              <h3>IOT</h3>
              <ul>
                  <li><span>Ipv4</span>: </li>
                  <li><span>Latitudine</span>: </li>
                  <li><span>Longitudine</span>: </li>
                  <li><span>Altitudine</span>: </li>
              </ul>
          </div>

        <div class="form-piantato">
          <p>L'albero e' stato piantato?</p>

        </div>
        <%if(Boolean.parseBoolean(request.getParameter("piantato"))==true){%>
            <p id="piantato" class="error">Albero Piantato</p>
        <%}else{ %>
            <input id="conferma" class="confermato" type="checkbox" value="piantato" onclick="conferma()">
            <label for="conferma">Si</label>
            <a  onclick="showiot()" id="forzare" class="submit">Conferma</a>
        <%} %>
      </div>
    </div>
  </div>
</div>


<script src="risorse/js/flush-submit.js"></script>


<%@ include file="footer.jsp" %>
</html>