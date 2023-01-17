<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="risorse/style/login.css"> <!-- style -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
</head>
<%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.UtenteDao" %>
<%@ page import="storage.OperatoreDao" %>
<%@ page import="storage.AdminDao" %>
<%
    String email = (String) request.getSession().getAttribute("email");
    UtenteDao utenteDao = new UtenteDao();
    OperatoreDao operatoreDao = new OperatoreDao();
    AdminDao adminDao = new AdminDao();

    if(email != null)
    {
        UtenteBean utente = utenteDao.doRetrieveByEmail(email);
        if(utente.getNomeUtente() == null){
            OperatoreBean operatoreBean = operatoreDao.doRetrieveByEmail(email);
            if(operatoreBean.getNomeOperatore() == null){
                AdminBean adminBean = adminDao.doRetrieveByEmail(email);
                if(adminBean.getNomeAdmin() == null){
                    response.sendRedirect(request.getContextPath()+"/login.jsp");
                }
                else {
                    response.sendRedirect(request.getContextPath()+"/admin.jsp");
                }
            }
            else{
                response.sendRedirect(request.getContextPath()+"/operatore.jsp");
            }
        }else {
            response.sendRedirect(request.getContextPath()+"/utente.jsp");
        }
    }

%>


<body class="all-body">

    <div class="all-form">
        <div class="form-container">
            <div class="drop">
                <div class="content">
                    <h2>Login</h2>
                     <%if(Boolean.parseBoolean(request.getParameter("errore"))==true){%>
                            <p id="errore" class="error">Credenziali errate, riprova</p>
                            <%}else{ %>
                            <p id="errore" class="error"></p>
                            <%} %>
                     <form action="AutenticazioneApplication" id="form" onsubmit="return validate(this)"> <!-- form effettivo -->
                        <span id="txt-email"></span>
                        <div class="inputBox">
                            <input id="email" type="text" placeholder="E-mail" required name ="email">
                        </div>

                        <span id="txt-password"></span>
                        <div class="inputBox">
                            <input id="password" type="password" placeholder="Password" required name = "password">
                            <div id="toggle" onclick="showHide()"></div>
                        </div>

                        <div class="inputBox">
                            <input type="submit" placeholder="Accedi">
                        </div>
                    </form>
                </div>
            </div>

            <a href="registrazione.jsp" class="btns">Registrati</a> <!-- script -->

        </div>
    </div>

    <%if(Boolean.parseBoolean(request.getParameter("check"))==true){%>
        <p id="errore" class="error">Utente già registrato, loggati</p>
    <%}else{ %>
        <p id="errore" class="error"></p>
    <%} %>

    <script src="risorse/js/password.js"></script>
    <script src="risorse/js/validate_login.js"></script>
</body>
</html>