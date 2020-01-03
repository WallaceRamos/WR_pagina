<%@page import="dominio.Funcionario"%>
<%
Funcionario funcionarioLogado = null;
if (session.getAttribute("funcionario") != null){
    funcionarioLogado = (Funcionario) session.getAttribute("funcionario");
}else{
    response.sendRedirect("/Site-Recanto-Ferraz/entrar.jsp");
}
%>