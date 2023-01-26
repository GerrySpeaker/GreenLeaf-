<!DOCTYPE html>
<html lang="en">
<%@ page import="storage.OperatoreDao" %>
<%@ page import="storage.AdminDao" %>
<%@ page import="bean.AdminBean" %>
<%@ page import="bean.OperatoreBean" %>
<%@ page import="storage.AssociatoDao" %>
<%@ page import="storage.RegioneDao" %>
<%@ page import="bean.AssociatoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="bean.RegioneBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
  <link rel="stylesheet" href="risorse/style/regione.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <title>Regione</title>
</head>
<%
  String email = (String) request.getSession().getAttribute("email");
  OperatoreDao operatoreDao = new OperatoreDao();
  AdminDao adminDao = new AdminDao();

  AdminBean adminBean = adminDao.doRetrieveByEmail(email);
  OperatoreBean operatoreBean = operatoreDao.doRetrieveByEmail(email);

  String nome = request.getParameter("nome");

  System.out.println(nome);

  AssociatoDao daoAsso = new AssociatoDao();

  RegioneDao daoreg = new RegioneDao();

%>
<%@ include file="header.jsp" %>

<div class="nontavere" id="popup">
  <script language="JavaScript">
    document.getElementById("popup").style.display = "block";
  </script>
  <form action="AggiungiCarrello" method="post">
    <input id="categoria" name="categoria" style="display:none" >
    <div class="scelta">
      <div class="all-regione">
        <!-- ripetere le regioni da qui -->
        <%
          ArrayList<AssociatoBean> associato = (ArrayList<AssociatoBean>) daoAsso.doRetrieveAlbero(nome);
          Iterator<AssociatoBean> ass = associato.iterator();

          while(ass.hasNext()){

            AssociatoBean association = ass.next();
            String regione = association.getRegioneAssociato();
            System.out.println(regione);
            RegioneBean prod = daoreg.doRetrieveByNome(regione);

            System.out.println(prod.toString());

        %>

        <div class="regione" id="<%=prod.getNomeRegione()%>">
          <div class="reg-card">
            <div class="radio-group">
              <img src="<%= prod.getUrl() %>"><!-- inserire  la regione -->
              <label class="radio">
                <input type="radio" id="regione" value ="<%=prod.getNomeRegione()%>" name="scelta">
                <span class="checkmark"></span>
              </label>
            </div>
          </div>
        </div>
        <% System.out.println("STampato");} %>
        <!-- a qui-->
      </div>

    </div>
    <button class="close" type="reset"><i class="fa-solid fa-xmark" ></i></button>
    <button class="btn-regione" type="submit" >Aggiungi al carrello</button>
  </form>
</div>

<script src = "risorse/js/sceltaCatalogo.js"></script>

<%@ include file="footer.jsp" %>
</html>