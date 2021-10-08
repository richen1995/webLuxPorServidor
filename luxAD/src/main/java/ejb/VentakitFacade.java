/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ventakit;
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
public class VentakitFacade extends AbstractFacade<Ventakit> implements VentakitFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VentakitFacade() {
        super(Ventakit.class);
    }
    
    @Override
    public List<Ventakit> obtenerlistakitsvntprv(String codvntkit){
        List<Ventakit> listVentakit = new ArrayList<Ventakit>();
        String consulta = null;
        try{
            consulta = "SELECT v FROM Ventakit v WHERE v.vntpId.vntpId = :codvntkit";
            Query query = em.createQuery(consulta);
            query.setParameter("codvntkit",Integer.parseInt(codvntkit));
            listVentakit = query.getResultList();
            if (!listVentakit.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listVentakit;
    }
}
