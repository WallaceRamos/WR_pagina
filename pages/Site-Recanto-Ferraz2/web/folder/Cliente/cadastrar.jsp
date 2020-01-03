
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.ClienteBD"%>
<%@page import="dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//@include file="/validarUsuario.jsp" %>
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
                $("#cpf").mask("000.000.000-00");
                 $("#telefone").mask("(00)0000-00000");
              $("#dataNascimento").mask("00/00/0000");
               
                
                $("#formCadastro").validate({
                    rules: {
                        nome: {
                            required: true,
                            maxlength: 40,
                            minlength: 5

                        },
                        cpf: {
                            required: true,
                            maxlength: 14,
                            minlength: 14
                        },

                        telefone: {
                            required: true,
                            maxlength: 13,
                            minlength: 13

                        },

                        dataNascimento: {
                            required: true,
                            maxlength: 10,
                            minlength: 10

                        },

                    },
                    submitHandler: function ("#formCadastro") {
                        $.notify("Orçamento enviado com sucesso", "success");
                    }
                })
            })

            





        </script>
    </head>
    <body>
        <%
            Cliente cliente = null;
            String cpf = request.getParameter("cpf");//recebe o dado da lista
            if (cpf != null) {//está alterando um cliente pelo cpf
                cliente = ClienteBD.getByCpf(cpf);
            } else { //está adicionando um cliente
                cliente = new Cliente();
            }

            String dataNascimento = "";
            if (cliente.getDataNascimento() != null) {
                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");//formatando o estilo de data para dia /mes /ano
                dataNascimento = formato.format(cliente.getDataNascimento());
            }
        %>
       


            <div class="container-fluid " id="interface">

                <!--cabeçalho-->
                <header >
                   
                    <div class="row">
                        <!--Titulo--> 
                        <!--Titulo--> 
                        <div class="col-sm-12">
                            <img src="../fotos/logo.png" alt="" class="img-fluid d-block mx-auto py-2"/>
                        </div>
                        <!--Menu-->
                        <nav class="navbar navbar-expand-lg col-12 navbar-light" id="menu">
                            <!--                    <div class="container">-->
                            <a class="navbar-brand d-block d-md-none text-white" href="#">Menu</a>
                            <button class="navbar-toggler text-white" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarResponsive">
                                <ul class="navbar-nav mx-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link text-white" href="../index.html">Home
                                            <span class="sr-only">(current)</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="../sobre.html">Sobre</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="../servicos.html">Serviços</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="../portifolio.html">Portifólio</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-white" href="../contato.html">Contato</a>
                                    </li>
                                    
                                </ul>
                            </div>
                            <!--                    </div>-->
                        </nav>
                    </div>
                </header>
                <!--formulario-->
                <section class="row bg-light">
                    <div class="col-md-10 offset-md-1 col-12">
                       <form name="formCadastro" method="post" action="salvar.jsp">
                            <div class="row">
                                <div class="col-12">
                                    <h1 class="text-center corVerde py-2">Cadastro</h1>

                                </div>

                                <div class="form-group col-md-6 col-12">
                                    <label>Nome</label>
                                    <input type="text" name="nome" id="nome" placeholder="Nome" class="form-control" value="<%=(cliente.getNome()!=null)? cliente.getNome() : "" %>" /> 
                                </div>
                                <div class="form-group col-sm-12 col-md-6">
                                    <label>E-mail</label>
                                    <input type="email" name="login" id="login" placeholder="Email"class="form-control" value="<%=(cliente.getLogin()!=null)? cliente.getLogin() : "" %>" />
                                </div>
                                <!--<div class="form-group col-sm-12 col-md-3">
                                    <label>Senha</label>
                                    <input type="text" name="senha" id="senha" placeholder="Senha"class="form-control" value="<%//=(cliente.getSenha()!=null)? cliente.getSenha() : "" %>" />
                                </div>-->
                                
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6 col-12">
                                    <label>CPF</label>
                                    <input type="text" name="cpf" id="cpf" placeholder="000.000.000-00" class="form-control" value="<%=(cliente.getCpf()!=null)? cliente.getCpf() : "" %>" />
                                </div>
                                <div class="form-group col-md-6 col-sm-12">
                                    <label>Telefone</label>
                                    <input type="text" name="telefone" id="telefone" placeholder="(00)0000-0000" class="form-control" value="<%=(cliente.getTelefone()!=null)? cliente.getTelefone() : "" %>" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4 col-sm-12">
                                    <label>Cidade</label>
                                    <input type="text" name="cidade" id="telefone" placeholder="Cidade" class="form-control" value="<%=(cliente.getCidade()!=null)? cliente.getCidade() : "" %>"  />
                                </div>




                                <div class="form-group col-md-4 col-sm-12">
                                    <label>Estado</label>
                                <%
                                    String estadoSelecionado = "---";
                                    if (cliente.getEstado() != null) {
                                        estadoSelecionado = cliente.getEstado();
                                    }
                                %>
                                <select class="form-control" name="estado">
                           <option value="---" <% if (estadoSelecionado.equals("--")) {
                        out.println("selected");
                    } %>>----</option>
                                    
                          <option value="AC" <% if (estadoSelecionado.equals("AC")) {
                        out.println("selected");
                    } %>>Acre</option>
                          
                          <option value="AL" <% if (estadoSelecionado.equals("AL")) {
                        out.println("selected");
                    } %>>Alagoas</option>
                          
                          <option value="AP" <% if (estadoSelecionado.equals("AP")) {
                        out.println("selected");
                    } %>>Amapá</option>
                          
                          <option value="AM" <% if (estadoSelecionado.equals("AM")) {
                        out.println("selected");
                    } %>>Amazonas</option>
                          
                          <option value="BA" <% if (estadoSelecionado.equals("BA")) {
                        out.println("selected");
                    } %>>Bahia</option>
                          
                          <option value="CE" <% if (estadoSelecionado.equals("CE")) {
                        out.println("selected");
                    } %>>Ceará</option>
                          
                          <option value="DF" <% if (estadoSelecionado.equals("DF")) {
                        out.println("selected");
                    } %>>Destrito Federal</option>
                          
                          <option value="ES" <% if (estadoSelecionado.equals("ES")) {
                        out.println("selected");
                    } %>>Espírito Santo</option>
                          
                          <option value="GO" <% if (estadoSelecionado.equals("GO")) {
                        out.println("selected");
                    } %>>Goiás</option>
                          
                          <option value="MA" <% if (estadoSelecionado.equals("MA")) {
                        out.println("selected");
                    } %>>Maranhão</option>
                          
                          <option value="MT" <% if (estadoSelecionado.equals("MT")) {
                        out.println("selected");
                    } %>>Mato Grosso</option>
                          
                          <option value="MS" <% if (estadoSelecionado.equals("MS")) {
                        out.println("selected");
                    } %>>Mato Grosso do Sul</option>
                          <option value="MG" <% if (estadoSelecionado.equals("MG")) {
                        out.println("selected");
                    } %>>Minas Gerais</option>
                          
                          <option value="PA" <% if (estadoSelecionado.equals("PA")) {
                        out.println("selected");
                    } %>>Pará</option>
                          
                          <option value="PB" <% if (estadoSelecionado.equals("PB")) {
                        out.println("selected");
                    } %>>Paraíba</option>
                          
                          <option value="PR" <% if (estadoSelecionado.equals("PR")) {
                        out.println("selected");
                    } %>>Paraná</option>
                          <option value="PE" <% if (estadoSelecionado.equals("PE")) {
                        out.println("selected");
                    } %>>Pernambuco</option>
                          
                          <option value="PI" <% if (estadoSelecionado.equals("PI")) {
                        out.println("selected");
                    } %>>Piauí</option>
                          
                           <option value="RJ" <% if (estadoSelecionado.equals("RJ")) {
                        out.println("selected");
                    }%>>Rio de Janeiro</option>
                           
                          <option value="RN" <% if (estadoSelecionado.equals("RN")) {
                        out.println("selected");
                    } %>>Rio Grande do Norte</option>
                          
                          <option value="RS" <% if (estadoSelecionado.equals("RS")) {
                        out.println("selected");
                    } %>>Rio Grande do Sul</option>
                          
                          <option value="RO" <% if (estadoSelecionado.equals("RO")) {
                        out.println("selected");
                    } %>>Rondônia</option>
                          
                          <option value="RR" <% if (estadoSelecionado.equals("RR")) {
                        out.println("selected");
                    } %>>Roraima</option>
                          
                          <option value="SC" <% if (estadoSelecionado.equals("SC")) {
                        out.println("selected");
                    } %>>Santa Catarina</option>
                          
                            <option value="SP" <% if (estadoSelecionado.equals("SP")) {
                        out.println("selected");
                    } %>>São Paulo</option>
                                     
                          <option value="SE" <% if (estadoSelecionado.equals("SE")) {
                        out.println("selected");
                    } %>>Sergipe</option>
                          
                          <option value="TO" <% if (estadoSelecionado.equals("TO")) {
                        out.println("selected");
                    } %>>Tocantins</option>
                          
                          <option value="ES" <% if (estadoSelecionado.equals("ES")) {
                        out.println("selected");
                    } %>>Estrangeiro</option>
                          

                                </select>
                            </div>
                            <div class="form-group col-md-4 col-sm-12">
                                <label>Data de Nacimento</label>
                                <input type="text" name="dataNascimento" placeholder="00/00/0000" class="form-control" value="<%=(cliente.getDataNascimento()!=null)? cliente.getDataNascimento() : "" %>" />

                            </div>
                        </div>


                        <div class="form-group ">
                            <input type="submit" name="salvar" value="Salvar" id="salvar" class="btn btn-dark btn-lg d-block mx-auto" style="background-color: #406028;" /> 
                            <input type="hidden" name="idAlterado" class="btn btn-dark btn-lg d-block mx-auto" style="background-color: #406028;"  value="<%=cpf%>" />
                        </div>
                    </form>  
                </div>
               
            </section>

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
                    <a class="navbar-brand" href="entrar.jsp">
                        <img src="fotos/configuracao.png" width="40" height="40" alt="">
                    </a>

                </div>
                </div>
                  
            </footer>

            
    </body>
</html>
