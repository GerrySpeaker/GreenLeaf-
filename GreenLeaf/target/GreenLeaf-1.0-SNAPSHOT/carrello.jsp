<%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  ArrayList<String> buoni = new ArrayList<>();
  buoni = (ArrayList<String>) session.getAttribute("buonoregalo");

  ArrayList<CategoriaBean> categoria = new ArrayList<>();

  categoria = (ArrayList<CategoriaBean>) session.getAttribute("prodottiCart");


  ArrayList<String> regioni = new ArrayList<>();
  regioni = (ArrayList<String>) session.getAttribute("regione");


%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Carrello</title>
  <link rel="stylesheet" href="risorse/style/carrello.css">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://code.jquery.com/jquery-3.3.1.slim.min.js">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<%@ include file="header.jsp" %>

<div class="all-cart">
  <div class="px-4 px-lg-0">
    <div class="container text-white py-5 text-center">
      <h1 class="display-4 text-uppercase">Il tuo carrello</h1>
    </div>

    <div class="pb-5">
      <div class="container">
        <div class="row" >
          <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

            <!-- Shopping cart table -->
            <div class="table-responsive">
              <table class="table">
                <thead>
                <tr>
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Prodotto</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Prezzo</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Regione</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Rimuovi</div>
                  </th>
                </tr>
                </thead>
                <tbody>
                  <%
                    if(buoni != null){
                        int i=0;
                        System.out.println("1");
                        while(i<buoni.size()){
                          System.out.println("2");%>
                      <tr>
                      <th scope="row" class="border-0">
                        <div class="p-1">
                          <img src="" alt="" width="100" class="img-fluid rounded shadow-sm">
                          <div class="ml-3 d-inline-block align-middle">
                            <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle">Buono regalo</a></h5><span class="text-muted font-weight-normal font-italic d-block"></span>
                          </div>
                        </div>
                      </th>
                      <td class="border-0 align-middle"><strong>50.0</strong></td>
                      <td class="border-0 align-middle"><strong></strong></td>
                      <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>

                      </tr>
                      <% i++; }
                  } else if (categoria != null){
                    Iterator<CategoriaBean> prodotto = categoria.iterator();
                    Iterator<String> regione = regioni.iterator();
                    while(prodotto.hasNext()){
                      CategoriaBean prod = prodotto.next();
                      String reg = regione.next(); %>

                  <!-- ripetere da qui-->
                  <tr>
                  <th scope="row" class="border-0">
                    <div class="p-1">
                      <img src="" alt="" width="100" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle"><%= prod.getNomeCategoria()%></a></h5><span class="text-muted font-weight-normal font-italic d-block"></span>
                      </div>
                    </div>
                  </th>
                  <td class="border-0 align-middle"><strong><%= prod.getPrezzo()%></strong></td>
                  <td class="border-0 align-middle"><strong><%= reg %></strong></td>
                  <td class="border-0 align-middle"><a href="#" class="text-dark"><i class="fa fa-trash"></i></a></td>


                  </tr>
                    <% } }%>
                  <!-- a qui -->

                </tbody>
              </table>
            </div>
            <!-- End -->
          </div>
        </div>

        <div class="row py-5 p-4 bg-white rounded shadow-sm">
          <div class="col-lg-6">
            <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Buono regalo</div>
            <div class="p-4">
              <p class="font-italic mb-4">Hai un buono regalo? Inseriscilo qui</p>
              <div class="input-group mb-4 border rounded-pill p-2">
                <input type="text" placeholder="Es: abcd12" aria-describedby="button-addon3" class="form-control border-0">
                <div class="input-group-append border-0">
                  <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Applica</button>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Recapito ordine</div>
            <div class="p-4">
              <p class="font-italic mb-4"></p>
              <ul class="list-unstyled mb-4">
                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Totale</strong>
                  <h5 class="font-weight-bold">$400.00</h5>
                </li>
              </ul><a href="#" class="btn btn-dark rounded-pill py-2 btn-block">Paypal</a> <br>
              </ul><a href="#" class="btn btn-dark rounded-pill py-2 btn-block">Procedi al checkout</a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

</div>


<%@ include file="footer.jsp" %>
</html>