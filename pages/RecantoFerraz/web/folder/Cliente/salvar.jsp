<%@page import="persistencia.ClienteBD"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Recanto Ferraz | Reserva</title>
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

        <link href='../css/calendario/fullcalendar.min.css' rel='stylesheet' />
        <link href='../css/calendario/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <script src='../js/calendario/lib/moment.min.js'></script>
        <script src='../js/calendario/lib/jquery.min.js'></script>
        <script src='../js/calendario/fullcalendar.min.js'></script>
        
    </head>


    <body>
        <%
            String idAlterado = request.getParameter("idAlterado");//receber dado de idAlterdo
            String nome = request.getParameter("nome");//receber dado de nome
            String cpf = request.getParameter("cpf");//receber dado cpf
            String telefone = request.getParameter("telefone");//receber dado telefone
            String dataNascimento = request.getParameter("dataNascimento");//receber dado dataNacimento
            String cidade = request.getParameter("cidade");//receber dado Cidade
            String estado = request.getParameter("estado");//receber dado estado
            String login = request.getParameter("login");
           // String senha = request.getParameter("senha");//receber dado email

            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");//formatar dataNacimento
            Date data = formato.parse(dataNascimento);//usar formato novo da datanacimento

            Cliente cliente;
            if (!idAlterado.equals("null")) {//se o idAlterado nao  for igual a null
                out.println("entrou");//exibir entrou
                cliente = ClienteBD.getByCpf(idAlterado);//procora o cpf selecionado na lista de clientes e altera
            } else { //se for um novo cadastro
                cliente = new Cliente();//adiciona o cliente na lista
            }

            cliente.setNome(nome);
            cliente.setCpf(cpf);
            cliente.setCidade(cidade);
            cliente.setEstado(estado);
            cliente.setDataNascimento(data);
            cliente.setTelefone(telefone);
            cliente.setLogin(login);
            //cliente.setSenha(senha);
            if (idAlterado != "null") {//se o idAlterado for difernte de null 
                ClienteBD.alterar(cliente);//Alterar o cliente na lista
                out.println("cliente alterado com sucesso");//escreve o cliente alterado com sucesso
                response.sendRedirect("../Solicitacao/cadastro.jsp?status=OK");//vai para a pagina cadastro de solicitação com status no endereçõ =OK
               
            } else {//se nao
                ClienteBD.inserir(cliente);//adicionar o cliente na lista
                out.println("cliente cadastrado com sucesso");//escrever cliente cadastrado com sucesso
                response.sendRedirect("listar.jsp?=cadastrado");//vai para a pagina listar com status cadastrado
                
            }

        %>
    </body>
</html>