<%@page import="persistencia.ClienteBD"%>
<%
String cpf = request.getParameter("cpf");//Receber dado cpf
ClienteBD.excluir(cpf);//o cliente com cpf seleciona sera apagado da lista
response.sendRedirect("listar.jsp");//redirecionar a pagina para a pagina listar.jsp
%>