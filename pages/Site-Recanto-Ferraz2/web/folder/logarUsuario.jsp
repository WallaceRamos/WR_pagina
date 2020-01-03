<%@page import="dominio.Cliente"%>
<%@page import="persistencia.ClienteBD"%>
<%
String login = request.getParameter("login");
String senha = request.getParameter("senha");

Cliente clienteEncontrado = ClienteBD.procurarPorLoginSenha(login, senha);
if (clienteEncontrado != null){
    session.setAttribute("cliente", clienteEncontrado);
    response.sendRedirect("Solicitacao/cadastro.jsp");
}else{
    response.sendRedirect("entrarUsuario.jsp?erro=USUARIO_NAO_EXISTE");
}
%>