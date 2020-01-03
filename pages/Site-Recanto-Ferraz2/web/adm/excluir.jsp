<%@page import="persistencia.FuncionarioBD"%>
<%
String codigo = request.getParameter("codigo");//Receber dado da lista
FuncionarioBD.excluir(Integer.parseInt(codigo));//o Funcionario com codigo selecionado sera apagado da lista
response.sendRedirect("listar.jsp");//volta para pagina listar
%>