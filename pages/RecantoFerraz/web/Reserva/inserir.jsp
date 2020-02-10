<%@page import="persistencia.SolicitacaoBD"%>
<%@page import="dominio.Solicitacao"%>
<%@page import="persistencia.PacoteBD"%>
<%@page import="dominio.Pacote"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.ReservaBD"%>
<%@page import="dominio.Reserva"%>
<%

    String idAlterado = request.getParameter("idAlterado");//receber dado de idAlterdo
    String titulo = request.getParameter("titulo");//receber dado de titulo
    String start = request.getParameter("start");//receber dado de start
    String end = request.getParameter("end");//receber dado de end
    String codigoPacote = request.getParameter("pacote");//receber dado de pacote
    String nome = request.getParameter("nome");//receber dado de nome
    String telefone = request.getParameter("telefone");//receber dado telefone
    String email = request.getParameter("email");//receber dado telefone 
  
     SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");//formata a data fornecida para dia /mes/ano
        Date data = formato.parse(start);//formata a data start 
     
        Date dato = formato.parse(end);//formata a data end 
        
        Pacote pacote = PacoteBD.getByCodigo(Integer.parseInt(codigoPacote));
    
    Reserva reserva;
    if (!idAlterado.equals("null")) {//se o idAlterado nao  for igual a null
        out.println("entrou");//exibir entrou
        reserva = ReservaBD.getByCodigo(Integer.parseInt(idAlterado));//procora o cpf selecionado na lista e altera
    } else { //se for um novo cadastro
        reserva = new Reserva();
    }
    
     
    reserva.setNome(nome);
    reserva.setTelefone(telefone);
    reserva.setEmail(email);
    reserva.setTitulo(titulo);
    reserva.setStart(data);
    reserva.setEnd(dato);
    reserva.setPacote(pacote);
   
            
             if (idAlterado != "null") {//se o idAlterado for difernte de null 
                ReservaBD.alterar(reserva);//Alterar o cliente na lista
                out.println("reserva alterada com sucesso");//escreve o reserva alterado com sucesso
                response.sendRedirect("listar.jsp?status=OK");//vai para a pagina listar com status no endereçõ =OK
               
            } else {
                ReservaBD.inserir(reserva);//adicionar o reserva na lista
                out.println("reserva cadastrada com sucesso");//escrever reserva cadastrado com sucesso
                response.sendRedirect("listar.jsp?status=OK");//vai para a pagina listar com status OK
                
            }
%>
<html>
    <head>
        <title>Cadastrado com sucesso</title>
    </head>
    <body>


        <a href="listar.jsp">lista de reserva</a>


    </body>
</html>