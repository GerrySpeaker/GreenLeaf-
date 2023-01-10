<!DOCTYPE html>
<html>
<head>
    <title>Sezione Admin</title>
    <link rel="stylesheet" href="risorse/style/user.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

<div class="all-userpage">
    <div class="navigation">
        <ul>
            <li class="list active">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-house"></i></span>
                    <span class="title">Home</span>
                </a>
            </li>

            <li class="list">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                    <span class="title">Logout</span>
                </a>
            </li>

            <li class="list">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-users"></i></span>
                    <span class="title">Lista operatori</span>
                </a>
            </li>

            <li class="list">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-user-plus"></i></span>
                    <span class="title">Crea operatore</span>
                </a>
            </li>



            <div class="indicator"></div>
        </ul>
    </div>


    <div class="page">
        <div class="page-title"><h2>Sezione utente</h2></div>

        <div class="tasks-wrapper">
          <p>
              <span> Email:</span> <%= aBean.getEmail() %>
             <br>
             <br>
              <span> Nome:</span> <%= aBean.getNomeAdmin() %>
             <br>
             <br>
              <span> Cognome:</span> <%= aBean.getCognomeAdmin() %>
          </p>
        </div>
      </div>
</div>

    <script src="risorse/js/user.js"></script>

</html>