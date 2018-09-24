<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Calculadora de IMC com JSP</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
  </head>
<body>

    <% String altura = request.getParameter("altura"); %>
    <% String idade = request.getParameter("idade"); %>
    
    <div class="container">
        <h1>Calcule seu IMC</h1>
        <h4>Sua altura: <%= altura %></h4>
        <h4>Sua idade: <%= idade %></h4>
        <form method="POST">
            <fieldset>
                <div class="form-group">
                    <input class="form-control" placeholder="Informe sua altura" name="altura" type="text">
                    <input class="form-control" placeholder="Informe sua idade" name="idade" type="text">
                </div>
                <button type="submit" class="btn btn-sm btn-success">Calcular</a>
            </fieldset>
        </form>
    </div>
</body>
</html>