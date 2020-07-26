<%-- 
    Document   : delete
    Created on : 25/07/2020, 14:01:04
    Author     : Alisson Soares
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Cliente"%>
<%@ page import="Dao.ClienteDao"%>

<%
    try{
        ClienteDao c2 = new ClienteDao();
        c2.Delete(Integer.parseInt(request.getParameter("id"))); //Integer.parseInt: Converte a String recebida em um número
        response.sendRedirect("../View/clientes.jsp");
    }catch(Exception erro){
        throw new RuntimeException("Erro 8 Controller(Delete): " +erro);
    }
%>