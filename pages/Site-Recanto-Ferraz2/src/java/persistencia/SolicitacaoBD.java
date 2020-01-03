
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Solicitacao;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Objects;

public class SolicitacaoBD {
     private static String caminho = "C:\\Users\\Wallace\\Documents\\NetBeansProjects\\PI 2ºSemestre\\Site-Recanto-Ferraz2\\";
    
    private static ArrayList<Solicitacao> lista = new ArrayList<Solicitacao>();
    //adiciona um objeto da classe Solicitacao 
    //na lista que simula o banco de dados
    public static void inserir(Solicitacao solicitacao){
        lerXml();
        
        if(lista.size() == 0){//se s lista estiver vazia
           solicitacao.setCodigo(1); 
        }else{//se alista tem objetos
        //pegar o ultimo codigo
        int ultimaPosicao = lista.size()-1;
        Solicitacao ultimaSolicitacao = lista.get(ultimaPosicao);
        //somar+1 no carrinho adicionado
        solicitacao.setCodigo(ultimaSolicitacao.getCodigo()+1);
        }
        lista.add(solicitacao);
        salvarXml();
    }
    
    public static void alterar(Solicitacao solicitacaoAlterada){
        excluir(solicitacaoAlterada.getCodigo());
        inserir(solicitacaoAlterada);
    }
    
     public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Solicitacao cadaSolicitacao = lista.get(i);
            if (cadaSolicitacao.getCodigo() == codigo) {
                lista.remove(i);
            }
        }
        salvarXml();
    }
   
    
        public static ArrayList<Solicitacao> listar(){
        lerXml();
        return lista;
    }
        public static Solicitacao getByCodigo(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Solicitacao cadaSolicitacao = lista.get(i);
            if (cadaSolicitacao.getCodigo() == codigo){
                return cadaSolicitacao;                
            }
        }
        return null;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "solicitacaos.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("solicitacao",Solicitacao.class);
            lista = (ArrayList<Solicitacao>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Solicitacao>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("solicitacao",Solicitacao.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "solicitacaos.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
    


