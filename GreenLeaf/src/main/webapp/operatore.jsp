<!DOCTYPE html>
<html>
<head>
    <title>Sezione Operatore</title>
    <link rel="stylesheet" href="risorse/style/user.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

</head>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.OperatoreDao" %>
<%@ page import="bean.OperatoreBean" %>

<%

    String mail = (String) session.getAttribute("email");
    OperatoreDao oDao = new OperatoreDao();
    OperatoreBean oBean = new OperatoreBean();

    oBean = oDao.doRetrieveByEmail(mail);


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
          <a href="Logout"><span>Effettua il Logout</span></a>
        </li>
        <br>
        <li class="item">
            <a href=""><span>Visualizza piantumazioni</span></a>
        </li>
        <br>
       
      </ul>
    </div>
  </div>
  <div class="page-content">
    <h2 class="big-text">Area personale Operatore</h2>
    <hr class="line">
    <ul class="tasks-wrapper">
        
        <li>
            <span> Email:</span> <%= oBean.getEmail() %>
        </li>
        <li>
            <span> Nome:</span> <%= oBean.getNomeOperatore() %>
        </li>
        <li>
            <span> Cognome:</span> <%= oBean.getCognomeOperatore() %>
        </li>
        <li>
            <span> Regione di competenza:</span> <%= oBean.getRegione() %>
        </li>

    </ul>
  </div>
</div>
</body>
</html>