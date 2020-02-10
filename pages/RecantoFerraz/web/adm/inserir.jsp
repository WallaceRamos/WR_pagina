<%@page import="persistencia.FuncionarioBD"%>
<%@page import="dominio.Funcionario"%>
<%

    String idAlterado = request.getParameter("idAlterado");//receber dado de idAlterdo
    String nome = request.getParameter("nome");//receber dado de nome
    String login = request.getParameter("login");//receber dado de login
    String senha = request.getParameter("senha");//receber dado de senha
 
    
     Funcionario funcionario;
      if (!idAlterado.equals("null")) {//se o idAlterado nao  for igual a null
                out.println("entrou");//exibir entrou
                funcionario = FuncionarioBD.getByCodigo(Integer.parseInt(idAlterado));//procora o cpf selecionado na lista e altera
            } else { //se for um novo cadastro
                funcionario = new Funcionario();
            }
            
    funcionario.setNome(nome);
    funcionario.setLogin(login);
    funcionario.setSenha(senha);
    
     if (idAlterado != "null") {//se o idAlterado for difernte de null 
                FuncionarioBD.alterar(funcionario);//Alterar o funcionario na lista
                out.println("funcionario alterado com sucesso");//escreve o funcionario alterado com sucesso
                response.sendRedirect("../adm/listar.jsp?status=Alterado");//vai para a pagina listar com status no endereçõ =Aterado
               
            } else {
                FuncionarioBD.inserir(funcionario);//adicionar o funcionario na lista
                out.println("funcionario cadastrado com sucesso");//escrever funcionario cadastrado com sucesso
                response.sendRedirect("../adm/listar.jsp?status=Cadastrado");//vai para a pagina entrar com status cadastrado
                
            }
    %>
    <html>
        <head>
            <title>Cadastrado com sucesso</title>
        </head>
        <body>
           
            
            <a href="listar.jsp">lista de funcionario</a>
            
            
        </body>
    </html>