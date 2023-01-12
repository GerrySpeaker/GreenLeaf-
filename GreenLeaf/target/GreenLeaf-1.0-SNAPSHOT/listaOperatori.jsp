<%@ page import="storage.OperatoreDao" %>
<%@ page import="bean.OperatoreBean" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Lista</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="risorse/style/lista.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    </head>

    <%
        Boolean admin = (Boolean) session.getAttribute("adminRoles");
        if(admin == null || admin == false)
        {
            response.sendRedirect(request.getContextPath()+"/error.jsp");
            return;
        }
        String mail = (String) session.getAttribute("email");
        OperatoreDao oDao = new OperatoreDao();
        OperatoreBean oBean = new OperatoreBean();

        ArrayList<OperatoreBean> listOperatori = new ArrayList<>();
        listOperatori = oDao.allOperatori(mail);
        OperatoreBean test = listOperatori.get(1);

    %>
    <div class="all-list">
        <div class="list">
            <h3>Operatori da te creati</h3>

            <% Iterator<OperatoreBean> operatore = listOperatori.iterator();
            int i = 0;
                while(operatore.hasNext()){
                    OperatoreBean op = operatore.next();
                    i++;
                    String email = op.getEmail();

            %>
            <div class="row"><!-- ripetere questo con un for da qui -->
                <div class="rank"><span><%=i%></span></div>
                <div class="operatore">
                    <h4><%=op.getNomeOperatore() + " " + op.getCognomeOperatore()%></h4>
                    <p><%=op.getRegione()%></p>
                </div>
            </div><!-- a qui -->
            <% } %>
            <button onclick="eliminaAccount(<%= test.getEmail() %>)" class="remove"><i class="fa-solid fa-user-minus"></i></button>
            
        </div>
    </div>

        <script src ="risorse/js/elimina.js"></script>
</html>