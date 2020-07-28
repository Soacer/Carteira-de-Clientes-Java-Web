<%-- 
    Document   : create
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
        if(request.getParameter("nome") == "" || request.getParameter("email") == ""){ //Caso os campos nome e email estejam vazios...
            response.sendRedirect("../View/cadastrar.html"); // ...Redireciona para a tela de cadastro
        }else{
            c1.setNome(request.getParameter("nome"));
            c1.setEmail(request.getParameter("email"));
            c2.create(c1);
            response.sendRedirect("../View/cadastrado.html");
        }
    }catch(Exception erro){
        throw new RuntimeException("Erro 6 Controller(Create): " +erro);
    }
%>