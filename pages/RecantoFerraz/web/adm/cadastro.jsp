
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.FuncionarioBD"%>
<%@page import="dominio.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/validarUsuario.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Recanto Ferraz | Cadastro</title>
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


        <script type="text/javascript">
            $(document).ready(function () {
              
                
                $("#formCadastro").validate({
                    rules: {
                        nome: {
                            required: true,
                            maxlength: 40,
                            minlength: 5

                        },
                        

                       login: {
                            required: true,
                            email: true
                        },
                        senha: {
                            required: true,
                            maxlength: 20,
                            minlength: 12
                        },
                    },
                    
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
                                <a class="nav-link text-white" href="../adm/home.jsp">Calendario</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link text-white" href="../Solicitacao/listar.jsp">Solicitações<span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../Reserva/listar.jsp">Reservas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../Pacote/listar.jsp">Pacotes</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../adm/listar.jsp">Administradores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../sair.jsp">Sair</a>
                            </li>

                        </ul>

                        </div>

                    </div>
                </nav>
    
               
            </header>
        <div class="container-fluid " id="interface">
 
          <div class="row">
        
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
          
        <div class="card card-signin my-5">
            
          <div class="card-body">
              

                
                  <%
            Funcionario funcionario = null;
            String codigo = request.getParameter("codigo");//recebe o dado da lista
            if (codigo != null) {//alterando um pacote da lista se o cpf for diferente de null
                funcionario = FuncionarioBD.getByCodigo(Integer.parseInt(codigo));//procura na lista o codigo
            } else { //está adicionando um funcionario
                funcionario = new Funcionario();
            }

           
        %>
                <form name="formFuncionario" method="post" action="inserir.jsp">
                    
                        <div class="form-group ">
                            <label>Nome</label>
                           <input type="text" name="nome" id="nome" placeholder="Nome" class="form-control" value="<%=(funcionario.getNome() != null) ? funcionario.getNome() : ""%>" />
                        </div>
                            
                        <div class="form-group ">
                            <label>Login</label>
                            <input type="text" name="login" id="login" placeholder="Email" class="form-control" value="<%=(funcionario.getLogin() != null) ? funcionario.getLogin() : ""%>"  />
                        </div>

                        <div class="form-group ">
                        <label>Senha</label>
                        <input type="text" name="senha" id="senha" placeholder="Senha" class="form-control" value="<%=(funcionario.getSenha() != null) ? funcionario.getSenha() : ""%>" />
                    </div>
                  
                    <div class="form-group">
                        <input type="submit" name="enviar" value="Salvar" class="btn btn-lg btn-dark btn-block text-uppercase" style="background-color: #406028;" />
                         <input type="hidden" name="idAlterado" class="btn btn-dark btn-lg d-block mx-auto" style="background-color: #406028;"  value="<%=codigo%>" />
                    </div>
                </form>
                
                    </div>
            
        </div>
          
      </div>
        
    </div>
                
                <!--Rodapé-->
             <footer class="row py-5">

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
                    <div class="text-right">
                    

                </div>
                </div>
                  
            </footer>
           
        </div>
           
        
    </body>
</html>
