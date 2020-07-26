 q q<%-- 
    Document   : clientes
    Created on : 25/07/2020, 17:32:06
    Author     : Alisson Soares
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dao.ClienteDao"%>
<%@page import="Model.Cliente"%>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Carteira de Clientes</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="CSS/style.css">
    </head>
    <body>
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="index.html">Carteira de Clientes</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                      <li class="nav-item active">
                          <a class="nav-link" href="../index.html"><i class="fa fa-home" style="font-size:24px"></i><span class="sr-only">(current)</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="clientes.jsp">
                            Clientes
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">
                          A Empresa
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">
                          Contatos
                        </a>
                      </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" id="espacamento_dir">
                      <input class="form-control mr-sm-2" type="search" placeholder="..." aria-label="Search">
                      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit"><i class="fa fa-search"></i>  Pesquisar Cliente</button>
                    </form>
                    <a href="cadastrar.html"><button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-edit"></i>  Cadastrar Cliente</button></a>
                </div>
            </nav>
        </div>
        
        <div class="espaco_vertical">
            <div class="espaco_vertical2">
                <div class="espaco_horizontal">
                    <div class="espaco_horizontal2">
                        <div class="card text-white bg-secondary mb-3">
                            <div class="card-body">
                                <center>
                                    <h2>Consulta de Clientes</h2>
                                </center>
                            </div>
                            <form method="post" action="clientes.jsp" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="espaco_horizontal">
                                        <div class="espaco_horizontal2">
                                            <input type="text" name="nome" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nome Completo">
                                        </div>
                                    </div>
                                </div>
                                <center>
                                    <small>Ou</small>
                                </center>
                                <br>
                                <div class="form-group">
                                    <div class="espaco_horizontal">
                                        <div class="espaco_horizontal2">
                                            <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Endereço Eletrônico">
                                        </div>
                                    </div>
                                </div>
                                <div class="espaco_vertical2">
                                    <div class="espaco_horizontal">
                                        <div class="espaco_horizontal2">
                                            <button type="submit" class="btn btn-success"><i class="fa fa-check"></i>  Consultar</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <%
                            try{
                                out.print("<table class='table'>");
                                out.print(" <thead>");
                                out.print("     <tr>");
                                out.print("         <th scope='col'> ID </th>");
                                out.print("         <th scope='col'> Nome </th>");
                                out.print("         <th scope='col'> Email </th>");
                                out.print("         <th scope='col'></th>");
                                out.print("         <th scope='col'></th>");
                                out.print("     </tr>");
                                out.print(" </thead>");
                                out.print(" <tbody>");
                                ClienteDao c2 = new ClienteDao();
                                if(request.getParameter("nome") == null || request.getParameter("email") == null){
                                    ArrayList<Cliente> lista = c2.retrieve_all();
                                    for(int num = 0; num < lista.size(); num++){
                                        out.print("     <tr>");
                                        out.print("         <td>"+lista.get(num).getId()+"</td>");
                                        out.print("         <td>"+lista.get(num).getNome()+"</td>");
                                        out.print("         <td>"+lista.get(num).getEmail()+"</td>");
                                        out.print("         <td><a href='atualizar.jsp?id="+lista.get(num).getId()+"&nome="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"'><button type='submit' class='btn btn-primary'><i class='fa fa-check'></i>  Editar</button></a></td>");
                                        out.print("         <td><a href='../Controller/delete.jsp?id="+lista.get(num).getId()+"'><button type='submit' class='btn btn-danger'><i class='fa fa-trash'></i>  Excluir</button></a></td>");
                                        out.print("     </tr>");
                                    }
                                }else if(request.getParameter("nome") == null && request.getParameter("email") != null){
                                    ArrayList<Cliente> lista = c2.retrieve_email(request.getParameter("email"));
                                    for(int num = 0; num < lista.size(); num++){
                                        out.print("     <tr>");
                                        out.print("         <td>"+lista.get(num).getId()+"</td>");
                                        out.print("         <td>"+lista.get(num).getNome()+"</td>");
                                        out.print("         <td>"+lista.get(num).getEmail()+"</td>");
                                        out.print("         <td><a href='atualizar.jsp?id="+lista.get(num).getId()+"&nome="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"'><button type='submit' class='btn btn-primary'><i class='fa fa-check'></i>  Editar</button></a></td>");
                                        out.print("         <td><a href='../Controller/delete.jsp?id="+lista.get(num).getId()+"'><button type='submit' class='btn btn-danger'><i class='fa fa-trash'></i>  Excluir</button></a></td>");
                                        out.print("     </tr>");
                                    }
                                }else{
                                    ArrayList<Cliente> lista = c2.retrieve_email(request.getParameter("nome"));
                                    for(int num = 0; num < lista.size(); num++){
                                        out.print("     <tr>");
                                        out.print("         <td>"+lista.get(num).getId()+"</td>");
                                        out.print("         <td>"+lista.get(num).getNome()+"</td>");
                                        out.print("         <td>"+lista.get(num).getEmail()+"</td>");
                                        out.print("         <td><a href='atualizar.jsp?id="+lista.get(num).getId()+"&nome="+lista.get(num).getNome()+"&email="+lista.get(num).getEmail()+"'><button type='submit' class='btn btn-primary'><i class='fa fa-check'></i>  Editar</button></a></td>");
                                        out.print("         <td><a href='../Controller/delete.jsp?id="+lista.get(num).getId()+"'><button type='submit' class='btn btn-danger'><i class='fa fa-trash'></i>  Excluir</button></a></td>");
                                        out.print("     </tr>");
                                    }
                                }
                                out.print(" </tbody>");
                                out.print("</table>");
                            }catch(Exception erro){
                                    throw new RuntimeException("Erro 9 (Clientes): " +erro);
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="rodape">
            <footer class="container py-5">
                <div class="row">
                    <h3 id="cor_letra">Projeto Desenvolvido por: <i class="fa fa-copyright"></i>  Alisson de Carvalho Soares</h3>
                </div>
            </footer>
        </div>
    </body>
</html>