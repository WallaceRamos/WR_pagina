<%@page import="dominio.Funcionario"%>
<%@page import="persistencia.FuncionarioBD"%>
<%
String login = request.getParameter("login");
String senha = request.getParameter("senha");

Funcionario funcionarioEncontrado = FuncionarioBD.procurarPorLoginSenha(login, senha);
if (funcionarioEncontrado != null){
    session.setAttribute("funcionario", funcionarioEncontrado);
    response.sendRedirect("adm/home.jsp");
}else{
    response.sendRedirect("entrar.jsp?erro=USUARIO_NAO_EXISTE");
}
%>