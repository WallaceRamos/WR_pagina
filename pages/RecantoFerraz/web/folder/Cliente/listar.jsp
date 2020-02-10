<%@page import="dominio.Funcionario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Cliente"%>
<%@page import="persistencia.ClienteBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/validarUsuario.jsp" %>
<!DOCTYPE html>
<html>
   <head>
        <title>Recanto Ferraz | Lista de Clientes</title>
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
    </head>
    <body>
         <!--cabeçalho-->
            <header >
                
                
                <nav class="navbar navbar-expand-lg navbar-dark"  id="menu">

                    <div class="container">

                        <a class="navbar-brand" href="../index.html">
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
                                <a class="nav-link text-white" href="../Reserva/listar.jsp">Reserva</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../Pacote/listar.jsp">Pacotes</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../adm/listar.jsp">Administradores</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="../adm/contato.jsp">Reportar Bugs</a>
                            </li>
                             
                        </ul>

                        </div>

                    </div>
                </nav>
    
               
            </header>
         
        
        <div class="container-fluid " id="interface">
           
            <h2 class="text-center corVerde py-2" id="espaco">Lista de Clientes</h2>
        <div class="table-responsive">
        <table class="table table-bordered">
            <thead  style="background-color: #406028; color:white;">
                <tr>
                    <th>CPF</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                    <th>Data de Nascimento</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
            <%
            SimpleDateFormat formato=new SimpleDateFormat("dd/MM/yyyy");  //formatar a data para dia/mes/ano  
                
            ArrayList<Cliente> clientes = ClienteBD.listar();// declarando e instanciando uma lista de clientes

            for(int i=0; i < clientes.size(); i++){//funçao a cada inteiro difernte de 0  a lista d cliente aulmenta 1 apos passar por um cliente
                Cliente cadaCliente = clientes.get(i);
                String dataNascimento = "";// a data de nacimento for igual a vazio
                if (cadaCliente.getDataNascimento() != null){//a data de nacimento não e igual a null
                    dataNascimento = formato.format(cadaCliente.getDataNascimento());//formatar a data de nacimento para o farmato desejado
                }
                %>
                <tr>
                    <td><%=cadaCliente.getCpf()%></td>
                    <td><%=cadaCliente.getNome()%></td>
                    <td><%=cadaCliente.getLogin()%></td>
                    <td><%=cadaCliente.getTelefone()%></td>
                    <td><%=cadaCliente.getCidade()%></td>
                    <td><%=cadaCliente.getEstado()%></td>
                    <td><%=formato.format(cadaCliente.getDataNascimento())%></td>
                    <td>
                       <a class="btn btn-dark"style="background-color: #406028;" href="cadastrar.jsp?cpf=<%=cadaCliente.getCpf()%>">Alterar</a>
                        <a class="btn btn-dark"style="background-color: #406028;" href="excluir.jsp?cpf=<%=cadaCliente.getCpf()%>" onclick="return confirm('Deseja realmente excluir?')">Excluir</a>
                    </td>
                </tr>
                <%
          
            }
            %>
            </tbody>
        </table>
        </div>
            
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
