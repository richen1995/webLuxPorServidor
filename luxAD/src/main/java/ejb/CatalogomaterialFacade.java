/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Catalogomaterial;
import entidades.Cotizacion;
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
public class CatalogomaterialFacade extends AbstractFacade<Catalogomaterial> implements CatalogomaterialFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CatalogomaterialFacade() {
        super(Catalogomaterial.class);
    }

    @Override
    public List<Catalogomaterial> obtenerSubCatalogos(String codcatalogo) {
        List<Catalogomaterial> listCatalogomaterial = new ArrayList<Catalogomaterial>();
        String consulta = null;
        try{
            consulta = "SELECT cm FROM Catalogomaterial cm WHERE cm.catId.catId=:codcat";
            Query query = em.createQuery(consulta);
            query.setParameter("codcat",Integer.parseInt(codcatalogo));
            listCatalogomaterial = query.getResultList();
            if (!listCatalogomaterial.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listCatalogomaterial;
    }
    
}
