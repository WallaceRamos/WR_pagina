/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Cliente;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

/**
 *
 * @author le_gu
 */
public class ClienteBD {
    private static ArrayList<Cliente> lista = new ArrayList<Cliente>();
    private static String caminho = "C:\\Users\\Wallace\\Desktop\\PI\\RecantoFerraz-- projeto\\xml\\";
    
    public static void inserir(Cliente novoCliente){
        lerXml();
        lista.add(novoCliente);
        salvarXml();
    }
        
    public static void alterar(Cliente clienteAlterado){
        excluir(clienteAlterado.getCpf());
        inserir(clienteAlterado);
    }
    
    public static void excluir(String cpf){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Cliente cadaCliente = lista.get(i);
            if (cadaCliente.getCpf().equals(cpf)){
                lista.remove(i);
                break;
            }
        }
        salvarXml();
    }
    
    public static ArrayList<Cliente> listar(){
        lerXml();
        return lista;
    }
    
    public static Cliente getByCpf(String cpf){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Cliente cadaCliente = lista.get(i);
            if (cadaCliente.getCpf().equals(cpf)){
                return cadaCliente;                
            }
        }
        return null;
    }
    
    //pega o que está no XML e coloca na lista 
    public static void lerXml(){
        File arquivo=new File(caminho + "clientees.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("cliente",Cliente.class);
            lista = (ArrayList<Cliente>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Cliente>();
        }
    }
    
    //pega o que está na lista e salva no XML
    public static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("cliente",Cliente.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "clientees.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }   
    }
  
     public static Cliente procurarPorLoginSenha(String login, String senha){
        lerXml();
        Cliente clienteEncontrado = null;
        for(int i=0; i < lista.size(); i++){
            Cliente cliente = lista.get(i);
            if (cliente.getLogin().equals(login) && cliente.getSenha().equals(senha)){
                clienteEncontrado = cliente;
                break;
            }
        }
        return clienteEncontrado;
    }
}
