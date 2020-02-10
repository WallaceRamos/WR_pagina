
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Pacote;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

public class PacoteBD {
    
     private static String caminho = "C:\\Users\\Wallace\\Documents\\NetBeansProjects\\PI 2ºSemestre\\Site-Recanto-Ferraz2\\";
    
    private static ArrayList<Pacote> lista = new ArrayList<Pacote>();
    //adiciona um objeto da classe Pacote 
    //na lista que simula o banco de dados
    public static void inserir(Pacote pacote){
        lerXml();
        if(lista.size() == 0){ //Se a lista estiver vazia
           pacote.setCodigo(1);
        } else { //Se a lista tem objeto, vamos pegar o ultimo codigo e somar 1
           //Ultima posição da lista é o tamanho - 1
           int ultimaPosicao = lista.size() - 1;
           Pacote ultimoPacote = lista.get(ultimaPosicao);
           //Soma + 1 no carrinho adicionado
           pacote.setCodigo(ultimoPacote.getCodigo() + 1);
        }
        lista.add(pacote);
        salvarXml();
    }
    
    public static void alterar(Pacote pacoteAlterado){
        excluir(pacoteAlterado.getCodigo());
        inserir(pacoteAlterado);
    }
    
    //recebe o atributo que identifica cada objeto
    //da classe Pacote
    public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Pacote cadaPacote = lista.get(i);
            
            //procura o pacote que tem o CPF igual 
            //Ã  variÃ¡vel "codigo", que tÃ¡ chegando entre
            //os parÃªnteses
            if (cadaPacote.getCodigo() == codigo){
                lista.remove(i);
            }
        }
        salvarXml();
    }
       public static ArrayList<Pacote> listar(){
        lerXml();
        return lista;
    }
        public static Pacote getByCodigo(int codigo){
        lerXml();
        Pacote pacoteEncontrado = null;
        for(int i=0; i < lista.size(); i++){
            Pacote cadaPacote = lista.get(i);
            
            //procura o pacote que tem o CPF igual 
            //Ã  variÃ¡vel "cpf", que tÃ¡ chegando entre
            //os parÃªnteses
            if (cadaPacote.getCodigo() == codigo){
                pacoteEncontrado = cadaPacote;
                break;
            }
        }
        return pacoteEncontrado;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "pacotees.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("pacote",Pacote.class);
            lista = (ArrayList<Pacote>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Pacote>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("pacote",Pacote.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "pacotees.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
    

