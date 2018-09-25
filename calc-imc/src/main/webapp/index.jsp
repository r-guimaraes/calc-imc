<!doctype html>
<html lang="pt-br">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Calculadora de IMC com JSP</title>    

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/imc.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <a class="navbar-brand" href="#">CheckIMC</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
        <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="http://rodrigodeoliveira.net.br/calculadora_churrasco/" target="_blank">Calculadora de Churrasco</a>
        </li>
        <li class="nav-item">
            <a class="nav-link disabled" href="https://github.com/r-guimaraes">Fale Conosco</a>
        </li>
        </ul>
    </div>
</nav>
<div class="container jumbotron">
    <h1>Calcule seu IMC</h1>
    <p>
        O cálculo do IMC é obtido dividindo o peso (em quilogramas) pela altura (em metros) ao quadrado.
        Para saber se está em forma, basta preencher os campos abaixo:
    </p>

    <form method="POST">
        <fieldset>
            <div class="form-group">
                <input class="form-control" placeholder="Informe sua altura (em cm)" name="altura" required>
                <br>
                <input class="form-control" placeholder="Informe seu peso (em Kg)" name="peso" required>
                <br>
                <input class="form-control" placeholder="Informe sua idade" name="idade" type="number" required>
            </div>
            <button type="submit" class="btn btn-sm btn-success">Calcular</button>
        </fieldset>
    </form>
    
    <%
        String alturaStr = request.getParameter("altura");
        String pesoStr = request.getParameter("peso");
        String idadeStr = request.getParameter("idade");

        if (pesoStr != null) {
            Float peso = Float.parseFloat(pesoStr);
            if (peso instanceof Float && alturaStr != null) {
                Float alturaCM = Float.parseFloat(alturaStr);
                Float altura = alturaCM/100;

                Float IMC = (peso / (altura * altura));
                out.print("<hr><p><strong>Seu IMC é: </strong>" + IMC + "</p>");

                if (idadeStr != null) {
                    int idade = Integer.parseInt(idadeStr);

                    if (IMC >= 18.5 && IMC < 25) {
                        out.print("<div class='ok'>Parabéns! Você está no peso mais saudável! ;)</div>");
                    }

                    if (idade >= 29 && IMC >= 29.0) {
                        out.print("<div class='danger'>Cuidado! Nessa idade o metabolismo diminui, e você já está obeso!</div>");
                    }
                }
            }
            %>
            <h5>Confira a imagem de referência sobre os valores do IMC</h5>
            <p>
                <img class="img-thumbnail rounded mx-auto d-block" src="https://static.tuasaude.com/media/article/jn/ag/imc_30445_l.jpg" alt="Referência IMC">
            </p>
        <% 
        }
    %>
    <section id="footer">
        <strong>Desenvolvido por </strong>
        <a href="https://github.com/r-guimaraes" target="_blank"> @r-guimaraes
            <img src="https://avatars0.githubusercontent.com/u/1596813?s=88&v=4" alt="@r-guimaraes" width="35px">
        </a>
    </section>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
