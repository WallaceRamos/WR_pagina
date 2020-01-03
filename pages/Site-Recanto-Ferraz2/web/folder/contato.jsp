
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/validarUsuario.jsp" %>
<!DOCTYPE html>
<html>
     <head>
        <title>Recanto Ferraz | Contato</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="../js/additional-methods.min.js" type="text/javascript"></script>
        <script src="../js/localization/messages_pt_BR.js" type="text/javascript"></script>
        <script src="../js/notify.min.js" type="text/javascript"></script>
        <script src="../js/jquery.mask.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">

        <script type="text/javascript">
            $(document).ready(function () {
                $("#formCadastro").validate({
                    rules: {
                        mensagem: {
                            required: true,
                            maxlength: 200,
                            minlength: 10,
                            minWords: 3
                        },

                    },
                    submitHandler: function (form) {
                        $.notify("Orçamento enviado com sucesso", "success")
                    }
                })
            })
            




        </script>
    </head>

    <body>
        <!--cabeçalho-->
            <header >
                
                
                <nav class="navbar navbar-expand-lg navbar-dark"  id="menu">

                    <div class="container">

                        <a class="navbar-brand" href="../adm/home.jsp">
    <img src="../fotos/logo-menor.png" width="70" height="70" class="d-inline-block " alt="">
    Recanto Ferraz
  </a>
                  
                        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">

                            <span class="navbar-toggler-icon"></span>

                        </button>

                        <div class="collapse navbar-collapse" id="navbarResponsive">
                            

                            <ul class="navbar-nav mx-auto">
                                <li class="nav-item">
                                <a class="nav-link text-white" href="home.jsp">Calendario</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link text-white" href="../Solicitacao/listar.jsp">Solicitações<span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../Reserva/listar.jsp">Reserva</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../Pacote/listar.jsp">Pacote</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="listar.jsp">Administradores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../Cliente/listar.jsp">Clientes</a>
                            </li>
                             
                        </ul>

                        </div>

                    </div>
                </nav>
    
               
            </header>
        <div class="container-fluid " id="interface">


            <!--formulario-->
            <section class="row bg-light">
                <div class="col-md-10 offset-md-1 col-12">
                    <form name="formCadastro" id="formCadastro" method="post">
                       
                            <div class="col-12">
                                <h1 class="text-center corVerde py-2">Bugs</h1>
                            </div>

                        
                        <div class="form-group col-12">
                            <label>Mensagem</label>
                            <textarea class="form-control" id="mensagem" name="mensagem" rows="5" placeholder="Qual é o problema?"></textarea>
                        </div>
                        <div class="form-group ">
                            <input type="submit" name="salvar" id="salvar" class="btn btn-dark btn-lg d-block mx-auto" style="background-color: #406028;" />    
                        </div>
                    </form>  
                </div>
              
            </section>

           
                  <!--Rodapé-->
            <footer class="row py-5 ">

                <div class="col-md-4 col-12">
                    <p class="text-center"> Endereço</p>
                    <p class="text-center">Alameda Seis de Janeiro, 470 - Pedro Leme - Roseira</p>
                    <ul class="list-social p-0 m-0">
                        <li class="social-item"><a href="https://www.facebook.com/Ferraz.recanto/?ref=br_rs" target="_blank"><i class="fab fa-facebook-square"></i></a></li>
                        <li class="social-item"><a href="https://www.instagram.com/recanto_ferraz/" target="_blank"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                    
                </div>

                <div class="text-center col-md-4 col-12">
                    <ul class="list-contato">
                        <li><i class="fas fa-envelope"></i> Email</li>
                        <li><i class="fas fa-envelope"></i> contato@recantoferraz.com.br</li>
                       
                    </ul>
                </div>
                <div class="col-md-4 col-12">
                    <ul class="list-contato text-center">
                        <li><i class="fas fa-envelope"></i> Telefone</li>
                        <li><i class="fas fa-phone"></i> (12) 3646-1389</li>
                        <li><i class="fab fa-whatsapp"></i> (12) 99619-6003 </li>
                    </ul>
                </div>
            </footer>
        </div>
    </body>
</html>

</html>
