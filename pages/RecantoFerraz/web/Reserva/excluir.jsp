<%@page import="persistencia.ReservaBD"%>
<%
String codigo = request.getParameter("codigo");//Receber dado cpf
ReservaBD.excluir(Integer.parseInt(codigo));//o cliente com cpf seleciona sera apagado da lista
response.sendRedirect("listar.jsp");//redirecionar a pagina para a pagina listar.jsp
%>
%>