/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ventamaterial;
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
public class VentamaterialFacade extends AbstractFacade<Ventamaterial> implements VentamaterialFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VentamaterialFacade() {
        super(Ventamaterial.class);
    }
    
    @Override
    public List<Ventamaterial> obtenerlistamaterialesvntprv(String codvntmat){
        List<Ventamaterial> listVentamaterial = new ArrayList<Ventamaterial>();
        String consulta = null;
        try{
            consulta = "SELECT v FROM Ventamaterial v WHERE v.vntpId.vntpId = :codvntmat";
            Query query = em.createQuery(consulta);
            query.setParameter("codvntmat",Integer.parseInt(codvntmat));
            listVentamaterial = query.getResultList();
            if (!listVentamaterial.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listVentamaterial;
    }
}
