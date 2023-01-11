<!DOCTYPE html>
<html>
<head>
    <title>Sezione utente</title>
    <link rel="stylesheet" href="risorse/style/user.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

    Boolean Utente = (Boolean) session.getAttribute("utente");
    if(Utente == null || Utente == false)
    {
        response.sendRedirect(request.getContextPath()+"/login.jsp");
        return;
    }

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
                    <span class="icon"><i class="fa-solid fa-trash-can"></i></span>
                    <span class="title">Elimina account</span>
                </a>
            </li>
    
            <li class="list">
                <a href="alberiAdottati.jsp">
                    <span class="icon"><i class="fa-solid fa-tree"></i></span>
                    <span class="title">Alberi adottati</span>
                </a>
            </li>
    
            <li class="list">
                <a href="">
                    <span class="icon"><i class="fa-solid fa-car"></i></span>
                    <span class="title">Calcolo CO2</span>
                </a>
            </li>

            <div class="indicator"></div>
        </ul>
    </div>


    <div class="page">
        <div class="page-title">
            <h2>Sezione utente</h2>
        </div>

        <div class="tasks-wrapper">
            <div class="space">
                <p><span> Email:</span> <%= uBean.getEmail() %></p>
                <p><span> Nome:</span> <%= uBean.getNomeUtente() %></p>
                <p><span>Cognome:</span> <%= uBean.getCognomeUtente() %></p>
                <p><span>Data di nascita:</span> <%= uBean.getDataNascita() %></p>
            </div>
        </div>
    </div>
</div>

    <script src="risorse/js/user.js"></script>

</html>