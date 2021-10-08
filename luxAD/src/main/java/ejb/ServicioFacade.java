/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

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
public class ServicioFacade extends AbstractFacade<Servicio> implements ServicioFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ServicioFacade() {
        super(Servicio.class);
    }
    
    @Override
    public List<Servicio> obtenerserviciosactivos(){
        List<Servicio> listServicio = new ArrayList<Servicio>();
        String consulta = null;
        try{
            consulta = "SELECT s FROM Servicio s WHERE s.srvEstado = true";
            Query query = em.createQuery(consulta);
            listServicio = query.getResultList();
            if (!listServicio.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listServicio;
    }
    
    @Override
    public List<Servicio> obtenerservicioporprioridad(){
        List<Servicio> listServicio = new ArrayList<Servicio>();
        String consulta = null;
        try{
            //consulta = "SELECT s FROM Servicio s WHERE s.srvEstado = true";
            consulta = "SELECT s FROM Servicio s WHERE s.srvEstado = true ORDER BY s.srvPrioridad";
            Query query = em.createQuery(consulta);
            listServicio = query.getResultList();
            if (!listServicio.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listServicio;
    }
}
