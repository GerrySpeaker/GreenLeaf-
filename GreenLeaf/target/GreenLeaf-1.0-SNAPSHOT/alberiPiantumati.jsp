<%@ page import="bean.AlberoBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="storage.OperatoreDao" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Lista alberi</title>
        <link rel="stylesheet" href="risorse/style/lista.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    </head>

    <%@ include file="header.jsp" %>
    <%
        String operatore = session.getAttribute("operatore").toString();
        if(operatore == null)
        {
            response.sendRedirect(request.getContextPath()+"/error.jsp");
            return;
        }
        String mail = (String) session.getAttribute("email");
        OperatoreDao operatoreDao = new OperatoreDao();
        ArrayList<AlberoBean> alberiDaPiantare = operatoreDao.visualizzaPiantumazioni(mail);


    %>
    <div class="all-list">
        <div class="list">
            <h3>Alberi da piantumare</h3>

            <% Iterator<AlberoBean> albero = alberiDaPiantare.iterator();

                while(albero.hasNext()){
                    AlberoBean prod = albero.next();

            %>
            <div class="row"><!-- ripetere questo con un for da qui -->
                <div class="rank"><span>1</span></div>
                <div class="operatore">
                    <h4><%= prod.getIdAlbero()%></h4>
                    <p><%=prod.getCategoria()%></p>
                    <p><%=prod.getStato()%></p>
                    <a href="visualizzaAlberoDaPiantare.jsp?idAlberoDaPiantare=<%= prod.getIdAlbero()%>" class="remove"><i class="fa-solid fa-pen"></i></a>
                </div><!-- a qui -->
            </div>
            <% }%>
        </div>

    </div>
    <%@ include file="footer.jsp" %>
</html>