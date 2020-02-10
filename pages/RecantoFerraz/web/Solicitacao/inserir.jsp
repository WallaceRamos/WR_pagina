<%@page import="persistencia.PacoteBD"%>
<%@page import="dominio.Pacote"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.SolicitacaoBD"%>
<%@page import="dominio.Solicitacao"%>
<%

 String idAlterado = request.getParameter("idAlterado");//receber dado de idAlterdo
    String titulo = request.getParameter("titulo");//receber dado de titulo
    String start = request.getParameter("start");//receber dado de start
    String end = request.getParameter("end");//receber dado de end
    String codigoPacote = request.getParameter("pacote");//receber dado de pacote
    String status = request.getParameter("status");//receber dado de status
    String nome = request.getParameter("nome");//receber dado de nome
    String telefone = request.getParameter("telefone");//receber dado telefone
    String email = request.getParameter("email");//receber dado telefone

      SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");//formata a data fornecida para dia /mes/ano
        Date data = formato.parse(start);//formata a data start 
     
        Date dato = formato.parse(end);//formata a data end 
    
    Solicitacao solicitacao;
    if (!idAlterado.equals("null")) {//se o idAlterado nao  for igual a null
        out.println("entrou");//exibir entrou
        solicitacao = SolicitacaoBD.getByCodigo(Integer.parseInt(idAlterado));//procora o cpf selecionado na lista e altera
    } else { //se for um novo cadastro
        solicitacao = new Solicitacao();
    }
    
    Pacote pacote = PacoteBD.getByCodigo(Integer.parseInt(codigoPacote));
    
    solicitacao.setNome(nome);
    solicitacao.setTelefone(telefone);
    solicitacao.setEmail(email);
    solicitacao.setTitulo(titulo);
    solicitacao.setStart(data);
    solicitacao.setEnd(dato);
    solicitacao.setPacote(pacote);
    solicitacao.setStatus(status);
            
        if (idAlterado != "null") {//se o idAlterado for difernte de null 
                SolicitacaoBD.alterar(solicitacao);//Alterar o cliente na lista
                out.println("solicitacao alterada com sucesso");//escreve o solicitacao alterada com sucesso
                response.sendRedirect("../index.html?status=OK");//vai para a pagina index com status no endereçõ =OK
               
            } else {
                SolicitacaoBD.inserir(solicitacao);//adicionar o reserva na lista
                out.println("solicitacao cadastrada com sucesso");//escrever solicitacao cadastrado com sucesso
                response.sendRedirect("../index.html?status=OK");//vai para a pagina index com status OK
                
            }
%>
<html>
    <head>
        <title>Cadastrado com sucesso</title>
    </head>
    <body>


        <a href="listar.jsp">lista de solicitacao</a>


    </body>
</html>