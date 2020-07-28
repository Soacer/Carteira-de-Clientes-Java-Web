package Dao;


import Model.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement; //Biblioteca feita para evitar o SQL injection
import java.sql.Statement; //Statement é o responsável por executar os teus códigos sql no banco de dados
import java.sql.ResultSet; //Resultset é uma classe da API JAVA que permite percorrermos um DataTable de alguma consulta em um banco de dados
import java.util.ArrayList; //Biblioteca que cria uma array com o resultado do BD 
import java.util.Optional;

/**
 *
 * @author Alisson Soares
 */
public class ClienteDao {
    
    private Connection conexao;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet result;
    private ArrayList<Cliente> lista = new ArrayList<>();
    
    public ClienteDao(){
        conexao = new ConnectionFactory().getConexao();
    }
    
    //Insert
    public void create(Cliente dados){
        String sql = "INSERT INTO clientes (id, nome, email) VALUES (DEFAULT, ?, ?);";
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, dados.getNome()); //Coloca os Valores nas '?' da string sql
            stmt.setString(2, dados.getEmail()); //Coloca os Valores nas '?' da string sql
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 2 (INSERT): " +erro);
        }
    }
    
    //Select
    public ArrayList<Cliente> retrieve_all(){
        String sql = "SELECT * FROM clientes";
        try{
            st = conexao.createStatement();
            result = st.executeQuery(sql);
            //System.out.println(result);
            while(result.next()){ //Laço de Repetição que visita todos os espaços da Array de retorno (Select)
                Cliente cliente = new Cliente();
                cliente.setId(result.getInt("id"));
                cliente.setNome(result.getString("nome"));
                cliente.setEmail(result.getString("email"));
                System.out.println(cliente);
                lista.add(cliente);
            }
        }catch(Exception erro){
            throw new RuntimeException("Erro 3 (Select All): " +erro);
        }
        return lista;
    }
    
    public ArrayList<Cliente> retrieve_nome(String nome){ //Select pelo Nome
        String sql = "SELECT * FROM clientes WHERE nome LIKE '"+nome+"'";
        try{
            st = conexao.createStatement();
            result = st.executeQuery(sql);
            while(result.next()){ //Laço de Repetição que visita todos os espaços da Array de retorno (Select)
                Cliente cliente = new Cliente();
                cliente.setId(result.getInt("id"));
                cliente.setNome(result.getString("nome"));
                cliente.setEmail(result.getString("email"));
                lista.add(cliente);
            }
        }catch(Exception erro){
            throw new RuntimeException("Erro 3.1 (Select Nome): " +erro);
        }
        return lista;
    }
    
    public ArrayList<Cliente> retrieve_email(String email){ //Select pelo Email
        String sql = "SELECT * FROM clientes WHERE nome LIKE '"+email+"'";
        try{
            st = conexao.createStatement();
            result = st.executeQuery(sql);
            while(result.next()){ //Laço de Repetição que visita todos os espaços da Array de retorno (Select)
                Cliente cliente = new Cliente();
                cliente.setId(result.getInt("id"));
                cliente.setNome(result.getString("nome"));
                cliente.setEmail(result.getString("email"));
                lista.add(cliente);
            }
        }catch(Exception erro){
            throw new RuntimeException("Erro 3.2 (Select Email): " +erro);
        }
        return lista;
    }
    
    //Update (Atualiza)
    public void update(Cliente dados){ 
        String sql = "UPDATE clientes SET nome = ?, email = ? WHERE id = ?";
        try{
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, dados.getNome()); //Coloca os Valores nas '?' da string sql
            stmt.setString(2, dados.getEmail()); //Coloca os Valores nas '?' da string sql
            stmt.setInt(3, dados.getId()); //Coloca os Valores nas '?' da string sql
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 4 (Update): " +erro);
        }
    }
    
    //Exclui
    public void Delete(int id){ //O parâmetro é o ID da linha da tabela do banco
        String sql = "DELETE from clientes WHERE id = " +id;
        try{
            st = conexao.createStatement();
            st.execute(sql);
            st.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 5 (Delete): " +erro);
        }
    }
    
}
