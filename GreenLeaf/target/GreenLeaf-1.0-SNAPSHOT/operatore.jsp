<!DOCTYPE html>
<html>
<head>
    <title>Sezione operatore</title>
    <link rel="stylesheet" href="risorse/style/user.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                <a href="Logout">
                    <span class="icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                    <span class="title">Logout</span>
                </a>
            </li>
    
            <li class="list">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-seedling"></i></span>
                    <span class="title">Visualizza piantumazioni</span>
                </a>
            </li>
    
            <li class="list">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-file-invoice"></i></span>
                    <span class="title">Informazioni formtive</span>
                </a>
            </li>
    
            

            <div class="indicator"></div>
        </ul>
    </div>


    <div class="page">
        <div class="page-title">
            <h2>Sezione admin</h2>
        </div>

        <div class="tasks-wrapper">
            <div class="space">
                <p><span> Email:</span> <%= oBean.getEmail() %></p>
                <p><span> Nome:</span> <%= oBean.getNomeOperatore() %></p>
                <p><span>Cognome:</span> <%= oBean.getCognomeOperatore() %></p>
                <p><span> Regione di competenza:</span> <%= oBean.getRegione() %></p>
            </div>
        </div>
    </div>
</div>

    <script src="risorse/js/user.js"></script>

</html>