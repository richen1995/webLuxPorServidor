/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Kit;
import entidades.Servicio;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Richard
 */
@Stateless
public class KitFacade extends AbstractFacade<Kit> implements KitFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public KitFacade() {
        super(Kit.class);
    }
    
    @Override
    public List<Kit> obtenerkitsdeservicio(String codigosrv){
        List<Kit> listkit = new ArrayList<Kit>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT k FROM Kit k WHERE k.srvId = :codsrv";
            Servicio servicio = new Servicio();
            servicio.setSrvId(codigosrv);
            Query query = em.createQuery(consultaSQL);
            query.setParameter("codsrv",servicio);
            listkit = query.getResultList();
            if (!listkit.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listkit;
    } 
    
    @Override
    public Kit obtenerkitregultimo(){
        Kit kit = new Kit();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT k FROM Kit k ORDER BY k.kitId DESC    ";
            Query query = em.createQuery(consultaSQL);
            query.setMaxResults(1);
            List<Kit> listkit = query.getResultList();
            if (!listkit.isEmpty()) 
                kit = listkit.get(0);
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        
        return kit;
    }
    
    @Override
    public List<Kit> obtenerkitsdepaginicio(){
        List<Kit> listkit = new ArrayList<Kit>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT k FROM Kit k WHERE k.kitEstado = :estado AND k.kitPgweb = :web";
            Query query = em.createQuery(consultaSQL);
            query.setParameter("estado",true);
            query.setParameter("web",true);
            listkit = query.getResultList();
            if (!listkit.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listkit;
    } 
}
