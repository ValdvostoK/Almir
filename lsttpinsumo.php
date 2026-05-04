<?php 
   include_once "conexao.php"; 
   $sql = "Select * from tipoinsumo;";
   $con = Conexao::conectar(); 
   $registros = $con->query($sql);  
   $con = Conexao::desconectar(); 
?>
   

   <!DOCTYPE html>
   <html lang="pt-br">
   <head>
    
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Tipo de Insumos</title>
   </head>
   <body>
       <h1>Listar Tipos de Insumos</h1>
       <table class="striped">
        <tr>
            <th>ID</th>
            <th>DESCRIÇÃO</th>
        </tr>
        <?php 
            foreach($registros as $linha){ ?>
            <tr>
                <td><?php echo $linha['id']; ?></td>
                <td><?php echo $linha['descricao']; ?></td>
            </tr>

        <?php    }
        ?> 
       </table>
   </body>
   </html>
