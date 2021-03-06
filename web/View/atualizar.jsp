<%-- 
    Document   : atualizar
    Created on : 25/07/2020, 18:32:22
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
                                <form method="get" action="../Controller/update.jsp" enctype="multipart/form-data">
                                    <input type="hidden" name="id2" value="<%=request.getParameter("id")%>">
                                    <div class="form-group">
                                        <div class="espaco_horizontal">
                                            <div class="espaco_horizontal2">
                                                <input type="text" name="nome2" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="<%=request.getParameter("nome")%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="espaco_horizontal">
                                            <div class="espaco_horizontal2">
                                                <input type="email" name="email2" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="<%=request.getParameter("email")%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="espaco_vertical2">
                                        <div class="espaco_horizontal">
                                            <div class="espaco_horizontal2">
                                                <button type="submit" class="btn btn-success"><i class="fa fa-check"></i>  Editar</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
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
