/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ventaprevia;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;

/**
 *
 * @author Richard
 */
@Stateless
public class VentapreviaFacade extends AbstractFacade<Ventaprevia> implements VentapreviaFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VentapreviaFacade() {
        super(Ventaprevia.class);
    }
    
    @Override
    public List<Ventaprevia> obtenerventapreviaporcedula(String cedula){
        List<Ventaprevia> listVentaprevia = new ArrayList<Ventaprevia>();
        String consulta = null;
        try{
            consulta = "SELECT v FROM Ventaprevia v WHERE v.perCedula.perCedula = :cedula";
            Query query = em.createQuery(consulta);
            query.setParameter("cedula",cedula);
            listVentaprevia = query.getResultList();
            if (!listVentaprevia.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listVentaprevia;
    }
    
    @Override
    public List<Ventaprevia> obtenerlistaordenadaporfecha(){
        List<Ventaprevia> listVentaprevia = new ArrayList<Ventaprevia>();
        Ventaprevia objVentaprevia;
        String consulta = null;
        try{
            consulta = "SELECT v FROM Ventaprevia v ORDER BY v.vntpFecha DESC";
            Query query = em.createQuery(consulta);
            //..
            listVentaprevia = query.getResultList();
            if (!listVentaprevia.isEmpty()){ 
                System.out.println("j - 1 : ");
                int k = 0, ini = 0;
                for (int i = 0; i < listVentaprevia.size() - 1; i++) {
                    if(listVentaprevia.get(i).getVntpFecha().equals(listVentaprevia.get(i+1).getVntpFecha())){
                        k++;
                        if(k == 1){
                            ini = i;
                        }
                    }else{
                        if(k > 0){
                            for (int l = 0; l <= k; l++){
                                for (int j = ini + 1; j <= i - l; j++) {
                                    if(listVentaprevia.get(j-1).getVntpHora().after(listVentaprevia.get(j).getVntpHora())){
                                        System.out.println("j - 1 : " + listVentaprevia.get(j-1).getVntpHora());
                                        System.out.println("j : " + listVentaprevia.get(j).getVntpHora());
                                        objVentaprevia = listVentaprevia.get(j-1);
                                        listVentaprevia.set(j-1,listVentaprevia.get(j));
                                        listVentaprevia.set(j,objVentaprevia);
                                    }
                                }
                            }
                        }
                        k = 0;
                    } 
                }
            }
        }catch(Exception e){
            System.out.println("Consulta Fallidaaaa");
            System.out.println("ERROR: " + e);
        }   
        return listVentaprevia;
    }
    
    @Override
    public List<Ventaprevia> obtenervntpedporfechas(String fi, String ff){
        List<Ventaprevia> listVentaprevia = new ArrayList<Ventaprevia>();
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        String consulta = null;
        //Date fechaInicial = new Date();
        //Date fechaInicial = formato.parse(fi);
        //Date fechaFinal = obtenerFechIniCalendar();
        try{
            Date fechaInicial = formato.parse(fi);
            Date fechaFinal = formato.parse(ff);
            //consulta = "SELECT v FROM Ventaprevia v WHERE a.actEstado = :estado AND a.actFechafin BETWEEN :fechaini AND :fechafin";
            consulta = "SELECT v FROM Ventaprevia v WHERE v.vntpFecha BETWEEN :fechaini AND :fechafin";
            Query query = em.createQuery(consulta);
            query.setParameter("fechaini",fechaInicial,TemporalType.DATE);
            query.setParameter("fechafin",fechaFinal,TemporalType.DATE);
            //query.setParameter("estado",estado);
            listVentaprevia = query.getResultList();
            if (!listVentaprevia.isEmpty()) 
                System.out.println("Hay Registros");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listVentaprevia;
    }
}
