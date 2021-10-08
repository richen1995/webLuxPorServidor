/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Materialservicio;
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
public class MaterialservicioFacade extends AbstractFacade<Materialservicio> implements MaterialservicioFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MaterialservicioFacade() {
        super(Materialservicio.class);
    }
    
    @Override
    public List<Materialservicio> obtenermaterialesdeservicio(String codigosrv)
    {
        List<Materialservicio> listmaterialsrv = new ArrayList<Materialservicio>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Materialservicio m WHERE m.srvId = :codsrv";
            Servicio servicio = new Servicio();
            servicio.setSrvId(codigosrv);
            Query query = em.createQuery(consultaSQL);
            query.setParameter("codsrv",servicio);
            listmaterialsrv = query.getResultList();
            if (!listmaterialsrv.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listmaterialsrv;
    }
}
