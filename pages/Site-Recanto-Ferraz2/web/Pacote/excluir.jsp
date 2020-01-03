<%@page import="persistencia.PacoteBD"%>
<%
String codigo = request.getParameter("codigo");//Receber dado da lista
PacoteBD.excluir(Integer.parseInt(codigo));//o pacote com codigo seleciona sera apagado da lista
response.sendRedirect("listar.jsp");//volta para pagina listar
%>