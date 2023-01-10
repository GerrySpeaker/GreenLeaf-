<!DOCTYPE html>
<html>
<head>
    <title>Sezione Utente</title>
    <link rel="stylesheet" href="risorse/style/user.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

</head>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.UtenteDao" %>
<%@ page import="bean.UtenteBean" %>
<%@ page import="application.Logout" %>

<%

    String mail = (String) session.getAttribute("email");
    UtenteDao uDao = new UtenteDao();
    UtenteBean uBean = new UtenteBean();

    uBean = uDao.doRetrieveByEmail(mail);


%>

<body class="mannaggia">
<div class="task-manager">
  <div class="left-bar">
    <div class="upper-part">
    </div>
    <div class="left-content">
      <ul class="action-list">
        <li class="item">
          <a href=""><span>Torna all'Homepage</span></a>
        </li>
        <br>
        <li class="item">
            <a href=""><span>Effettua il Login</span></a>
        </li>
        <br>
        <li class="item">
          <a href="Logout" > <span>Effettua il Logout</span></a>
        </li>
        <br>
        <li class="item">
          <a href=""><span>Elimina account</span></a>
      </li>
      <br>
        <li class="item">
            <a href=""><span>Recap adozioni</span></a>
        </li>
        <br>
        <li class="item">
            <a href=""><span>Monitoraggio</span></a>
        </li>
      </ul>
    </div>
  </div>
  <div class="page-content">
    <h2 class="big-text">Area personale Utente</h2>
    <hr class="line">
    <ul class="tasks-wrapper">
        
        <li>
            <span> Email:</span> <%= uBean.getEmail() %>
        </li>
        <li>
            <span> Nome:</span> <%= uBean.getNomeUtente() %>
        </li>
        <li>
            <span> Cognome:</span> <%= uBean.getCognomeUtente() %>
        </li>
        <li>
            <span> Data di nascita:</span> <%= uBean.getDataNascita() %>
        </li>

    </ul>
  </div>
</div>
</body>
</html>