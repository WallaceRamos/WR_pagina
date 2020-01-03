
<%@page import="persistencia.PacoteBD"%>
<%@page import="dominio.Pacote"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.ReservaBD"%>
<%@page import="dominio.Reserva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/validarUsuario.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Recanto Ferraz - Calendário de eventos</title>
        <!-- Meta tags -->
        <meta charset='utf-8'>

        <link href="../css/calendario/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/calendario/css/fontawesome.all.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/calendario/css/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/calendario/css/estilo.css" rel="stylesheet" type="text/css"/>

        <script src="../css/calendario/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../css/calendario/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../css/calendario/js/moment.min.js" type="text/javascript"></script>
        <script src="../css/calendario/js/fullcalendar.min.js" type="text/javascript"></script>
        <script src="../js/localization/messages_pt_BR.min.js" type="text/javascript"></script>
        <script src="../css/calendario/js/jquery.mask.min.js" type="text/javascript"></script>

<script type="text/javascript">
            $(document).ready(function () {
                  $("#telefone").mask("(00) 00000-0000");
                $("#formaCadastro").validate({
                    rules: {
                        nome: {
                            required: true,
                        },
                        titulo: {
                            required: true,
                        },
                        email: {
                            required: true,
                        },
                        telefone: {
                            required: true,
                        }
                    }     
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('#calendar').fullCalendar({
                    themeSystem: 'bootstrap4',
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay,listWeek'
                    },
                    defaultDate: Date(),
                    navLinks: true,
                    editable: true,
                    eventLimit: true,
                    eventClick: function (event) {
                        $('#visualizar #title').text(event.title);
                        $('#visualizar #title').val(event.title);
                        $('#visualizar #start').text(event.start.format('DD/MM/YYYY HH:mm'));
                        $('#visualizar #start').val(event.start.format('DD/MM/YYYY HH:mm'));
                        $('#visualizar #end').text(event.end.format('DD/MM/YYYY HH:mm'));
                        $('#visualizar #end').val(event.end.format('DD/MM/YYYY HH:mm'));
                        $('#visualizar').modal('show');
                        return false;
                    },
                    selectable: true,
                    selectHelper: true,
                    select: function (start, end) {
                        $('#cadastrar #start').val(moment(start).format('DD/MM/YYYY HH:mm')).mask('00/00/0000 00:00');
                        $('#cadastrar #end').val(moment(end).format('DD/MM/YYYY HH:mm')).mask('00/00/0000 00:00');
                        $('#cadastrar').modal('show');
                    },
                    events: [
           
                        {
                            title: 'envento',
                      start: '2019/10/12 22:31',
                            end: '2019/10/12 22:32',

                        },
                        {
                            title: 'aniversario',
                      start: '2019/10/12 22:33',
                            end: '2019/10/12 22:34',

                        },
            
            
                                                  
        
                    ]
                });

            });
        </script>
    </head>
    <body>
        <!--cabeçalho-->
        <header >


            <nav class="navbar navbar-expand-lg navbar-dark"  id="menu">

                <div class="container">

                    <a class="navbar-brand" href="../adm/home.jsp">
                        <img src="../fotos/logo-menor.png" style="padding: -10px;" width="70" height="70" class="d-inline-block " alt="">
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


            <%
                Reserva reserva = null;
                String codigo = request.getParameter("codigo");
                if (codigo != null) {
                    reserva = ReservaBD.getByCodigo(Integer.parseInt(codigo));
                } else { //está adicionando um reserva
                    reserva = new Reserva();
                }


            %>
            <div class="container">
                <div class="page-header">
                    <h1>Agenda</h1>
                </div>
                <div id='calendar'></div>
            </div>
            <div class="modal fade" id="visualizar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 data-backdrop="static" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-center">Detalhes do evento</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="visualizar">
                                <dl class="dl-horizontal">
                                    <dt>Título: </dt>
                                    <dd id="title"></dd>
                                    <dt>Início: </dt>
                                    <dd id="start"></dd>
                                    <dt>Término: </dt>
                                    <dd id="end"></dd>

                                </dl>
           
                                <!--<button type="button" class="btn btn-canc-vis btn-primary">Editar</button>
                                <button type="button" class="btn btn-danger">Excluir</button>
                            </div>
                           <div class="form">
                                <form name="formaCadastro" method="post" action="../Reserva/cadastro.jsp">
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Título:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="title" id="title" placeholder="Título do evento"value="<%//=(reserva.getTitulo()!=null)? reserva.getTitulo() : "" %>">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Pacote:</label>
                                        <div class="col-sm-10">
                                            <select name="" class="form-control" id="pacote">
                                                <option value="">Selecionar</option>
                                                <option value="">Casamentos</option>
                                                <option value="">Noivados</option>
                                                <option value="">Aniversários</option>
                                                <option value="">Formaturas</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Início:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="start" id="start">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-sm-2 col-form-label">Término:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" name="end" id="end">
                                        </div>
                                    </div>
                                    <input type="hidden" class="form-control" name="id" id="id">
                                    <div class="form-group row">
                                        <div class="col-sm-10">
                                            <button type="button" class="btn btn-canc-edit btn-primary">Cancelar</button>
                                            <button type="submit" class="btn btn-warning">Salvar Alterações</button>
                                        </div>
                                    </div>
                                </form>-->
                            </div>
                        </div>
                    </div>
                </div>
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
    <script>
        $('.btn-canc-vis').on("click", function () {
            $('.form').slideToggle();
            $('.visualizar').slideToggle();
        });
        $('.btn-canc-edit').on("click", function () {
            $('.visualizar').slideToggle();
            $('.form').slideToggle();
        });
    </script>
</html>