<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dominio.Reserva"%>
<%@page import="persistencia.ReservaBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/validarUsuario.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Recanto Ferraz | Lista de Reservas</title>
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

            <div class="text-right">
                <a class="btn btn-dark "style="background-color: #406028;" id="espaco" href="cadastro.jsp" >Adicionar Reserva</a>
            </div>
            <h2 class="text-center corVerde py-2">Lista de Reservas</h2>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead  style="background-color: #406028; color:white;">
                        <tr>

                            <th>Cliente</th>
                            <th>Contato</th>
                            <th>Título</th>
                            <th>Datas</th>

                            <th>Pacote</th>

                            <th>Links</th>
                        </tr>

                    </thead>
                    <tbody>
                        <%
                            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");//formata a data para dia/mes/ano
                            ArrayList<Reserva> lista = ReservaBD.listar();// declarando e instanciando uma lista de reservas

                            for (int i = 0; i < lista.size(); i++) {//funçao a cada inteiro diferente de 0  a lista d reservas almenta 1 apos passar por um reserva
                                Reserva reserva = lista.get(i);


                        %>

                        <tr>

                            <td><%=reserva.getNome()%></td>
                            <td><%=reserva.getTelefone()%> <br> <%=reserva.getEmail()%></td>
                            <td><%=reserva.getTitulo()%></td>

                            <td><strong>Início: </strong><%=formato.format(reserva.getStart())%> <br>
                                <strong>Final: </strong><%=formato.format(reserva.getEnd())%></td>

                            <td><%=reserva.getPacote().getNome()%></td>



                            <td>
                                <a class="btn btn-dark"style="background-color: #406028;" href="cadastro.jsp?codigo=<%=reserva.getCodigo()%>">Alterar</a>
                                <a class="btn btn-dark"style="background-color: #406028;" href="excluir.jsp?codigo=<%=reserva.getCodigo()%>" onclick="return confirm('Deseja realmente excluir?')">Excluir</a>
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
