<%@ page import="Carteira.Cliente"%>
<%      
    //Instanciando a Classe Importada
    Cliente c = new Cliente();
    
    //Utilizando o metodo público set para a classe receber o parametro
    c.setNome(request.getParameter("nome"));
    c.setEmail(request.getParameter("email"));
    
    response.sendRedirect("../index.html");
%>