<%-- 
    Document   : update
    Created on : 25/07/2020, 13:16:08
    Author     : Alisson Soares
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Cliente"%>
<%@ page import="Dao.ClienteDao"%>

<%      
    try{
        Cliente c1 = new Cliente();
        ClienteDao c2 = new ClienteDao();
        if(request.getParameter("nome").equals("") || request.getParameter("email").equals("")){ //Caso os campos nome e email estejam vazios...
            response.sendRedirect("../View/cadastrar.html"); // ...Redireciona para a Index
        }else{
            c1.setNome(request.getParameter("nome"));
            c1.setEmail(request.getParameter("email"));
            c2.update(c1);
            
        }
    }catch(Exception erro){
        throw new RuntimeException("Erro 7 Controller(Update): " +erro);
    }
%>