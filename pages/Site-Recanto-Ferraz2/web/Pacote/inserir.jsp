<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="persistencia.PacoteBD"%>
<%@page import="dominio.Pacote"%>
<%

   
    String idAlterado = request.getParameter("idAlterado");//receber dado de idAlterdo
   
    String nome = request.getParameter("nome");//receber dado de nome
    String quantidadeCadeiras = request.getParameter("quantidadeCadeiras");//receber dado de quantidadeCadeiras
    String quantidadeMesas = request.getParameter("quantidadeMesas");//receber dado de quantidadeMesas
    String quantidadeCapas = request.getParameter("quantidadeCapas");//receber dado de quantidadeCapas
    String quantidadeToalha = request.getParameter("quantidadeToalha");//receber dado de quantidadeToalha
    String decoracao = request.getParameter("decoracao");//receber dado de decoracao
    String brinquedos = request.getParameter("brinquedos");//receber dado de brinquedos

     Pacote pacote;
       if (!idAlterado.equals("null")) {//se o idAlterado nao  for igual a null
                out.println("entrou");//exibir entrou
                pacote = PacoteBD.getByCodigo(Integer.parseInt(idAlterado));//procora o cpf selecionado na lista e altera
            } else { //se for um novo cadastro
                pacote = new Pacote();//adiciona o cliente na lista
            }

   
    pacote.setNome(nome);
    pacote.setQuantidadeCadeiras(quantidadeCadeiras);
    pacote.setQuantidadeMesas(quantidadeMesas);
    pacote.setQuantidadeCapas(quantidadeCapas);
    pacote.setQuantidadeToalha(quantidadeToalha);
    pacote.setDecoracao(decoracao);
    pacote.setBrinquedos(brinquedos);
    
     if (idAlterado != "null") {//se o idAlterado for difernte de null 
                PacoteBD.alterar(pacote);//Alterar o cliente na lista
                out.println("funcionario alterado com sucesso");//escreve o funcionario alterado com sucesso
                response.sendRedirect("listar.jsp?status=Alterado");//vai para a pagina listar com status no endereçõ =Aterado
               
            } else {
                PacoteBD.inserir(pacote);//adicionar o funcionario na lista
                out.println("funcionario cadastrado com sucesso");//escrever funcionario cadastrado com sucesso
                response.sendRedirect("listar.jsp?status=Cadastrado");//vai para a pagina listar com status cadastrado
                
            }
    %>
    <html>
        <head>
            <title>Cadastrado com sucesso</title>
        </head>
        <body>
           
            
            <a href="listar.jsp">lista de pacote</a>
            
            
        </body>
    </html>