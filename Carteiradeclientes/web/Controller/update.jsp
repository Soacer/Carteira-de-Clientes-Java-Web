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
        if(request.getParameter("nome2") == "" || request.getParameter("email2") == ""){ //Caso os campos nome e email estejam vazios...
            response.sendRedirect("../View/clientes.jsp?"); // ...Redireciona para a tabela de clientes
        }else{
            c1.setId(Integer.parseInt(request.getParameter("id2")));
            c1.setNome(request.getParameter("nome2"));
            c1.setEmail(request.getParameter("email2"));
            c2.update(c1);
            response.sendRedirect("../View/atualizado.html");
        }
    }catch(Exception erro){
        throw new RuntimeException("Erro 7 Controller(Update): " +erro);
    }
%>