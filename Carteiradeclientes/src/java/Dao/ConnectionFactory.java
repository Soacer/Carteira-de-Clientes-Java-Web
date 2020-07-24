/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection; //Import da biblioteca de conexão
import java.sql.DriverManager; //Gerenciador do Driver
/**
 *
 * @author Alisson Soares
 */
public class ConnectionFactory {
    
    public Connection getConexao(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(
                    "jdbc:mysql://localhost/carteira","root"," "
            );//Caminho do Banco/Nome do Banco, Usuário do Banco, Senha
        }catch(Exception erro){
            throw new RuntimeException("Erro 1: " +erro);
        }
    }
}
