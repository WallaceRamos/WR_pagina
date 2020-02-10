
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Reserva;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Objects;

public class ReservaBD {
     private static String caminho = "C:\\Users\\Wallace\\Documents\\NetBeansProjects\\PI 2ºSemestre\\Site-Recanto-Ferraz2\\";
    
    private static ArrayList<Reserva> lista = new ArrayList<Reserva>();
    //adiciona um objeto da classe Reserva 
    //na lista que simula o banco de dados
    public static void inserir(Reserva reserva){
        lerXml();
        
        if(lista.size() == 0){//se s lista estiver vazia
           reserva.setCodigo(1); 
        }else{//se alista tem objetos
        //pegar o ultimo codigo
        int ultimaPosicao = lista.size()-1;
        Reserva ultimaReserva = lista.get(ultimaPosicao);
        //somar+1 no carrinho adicionado
        reserva.setCodigo(ultimaReserva.getCodigo()+1);
        }
        lista.add(reserva);
        salvarXml();
    }
    
    public static void alterar(Reserva reservaAlterada){
        excluir(reservaAlterada.getCodigo());
        inserir(reservaAlterada);
    }
    
     public static void excluir(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Reserva cadaReserva = lista.get(i);
            if (cadaReserva.getCodigo() == codigo) {
                lista.remove(i);
            }
        }
        salvarXml();
    }
   
    
        public static ArrayList<Reserva> listar(){
        lerXml();
        return lista;
    }
        public static Reserva getByCodigo(int codigo){
        lerXml();
        for(int i=0; i < lista.size(); i++){
            Reserva cadaReserva = lista.get(i);
            if (cadaReserva.getCodigo() == codigo){
                return cadaReserva;                
            }
        }
        return null;
    }
    
    private static void lerXml(){
        File arquivo=new File(caminho + "reservas.xml");
        if (arquivo.exists()){
            //armazenar XML no vetor
            XStream xstream=new XStream();
            xstream.alias("reserva",Reserva.class);
            lista = (ArrayList<Reserva>) xstream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Reserva>();
        }
    }
    
    private static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("reserva",Reserva.class);
        try{
            FileWriter escritor=new FileWriter(caminho + "reservas.xml");
            escritor.write( xstream.toXML(lista) );
            escritor.close();
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }
}
    


