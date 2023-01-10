<!DOCTYPE html>
<html>
<head>
    <title>Sezione Admin</title>
    <link rel="stylesheet" href="risorse/style/user.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

</head>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.AdminDao" %>
<%@ page import="bean.AdminBean" %>

<%

    String mail = (String) session.getAttribute("email");
    AdminDao aDao = new AdminDao();
    AdminBean aBean = new AdminBean();

    aBean = aDao.doRetrieveByEmail(mail);


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
            <a href=""><span>Visualizza operatori</span></a>
        </li>
        <br>
       
      </ul>
    </div>
  </div>
  <div class="page-content">
    <h2 class="big-text">Area personale Admin</h2>
    <hr class="line">
    <ul class="tasks-wrapper">
        
        <li>
            <span> Email:</span> <%= aBean.getEmail() %>
        </li>
        <li>
            <span> Nome:</span> <%= aBean.getNomeAdmin() %>
        </li>
        <li>
            <span> Cognome:</span> <%= aBean.getCognomeAdmin() %>
        </li>
    </ul>
  </div>
</div>
</body>
</html>