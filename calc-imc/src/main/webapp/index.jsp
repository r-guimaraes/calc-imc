<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Calculadora de IMC com JSP</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<div class="container">
    <h1>Calcule seu IMC</h1>
    <p>
        Calcule seu IMC dividindo o peso (em quilogramas) pela altura (em metros) ao quadrado.
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
                Float alturaMetros = Float.parseFloat(alturaStr);
                Float a = alturaMetros/100;

                Float IMC = (peso / (a * a));
                out.print("<hr><p><strong>Seu IMC: </strong>" + IMC + "</p>");

                if (idadeStr != null) {
                    int idade = Integer.parseInt(idadeStr);
                    if (idade >= 29 && IMC >= 29.0) {
                        out.print("Cuidado! Nessa idade o metabolismo diminui, e você já está obeso!");
                    }
                }
            }
        }
    %>

</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
