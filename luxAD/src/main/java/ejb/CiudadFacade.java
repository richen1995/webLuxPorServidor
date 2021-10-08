/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Ciudad;
import entidades.Ciudad;
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
public class CiudadFacade extends AbstractFacade<Ciudad> implements CiudadFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CiudadFacade() {
        super(Ciudad.class);
    }
    
    @Override
    public List<Ciudad> obtenerciudadesdeprovincia(String codprovincia){
        List<Ciudad> listaCiudad = new ArrayList<Ciudad>();
        String consulta;
        try {
            consulta = "SELECT c FROM Ciudad c WHERE c.prvCodigo.prvCodigo = ?1";

            Query query = em.createQuery(consulta);
            query.setParameter(1, codprovincia);
            listaCiudad = query.getResultList();
            if (!listaCiudad.isEmpty()) {
                System.out.println("Se ha producido un error en la conulta");
//                listaCiudad = listaCiudad.get(0);
}
        } catch (Exception e) {
        }
        return listaCiudad;
    }
}
