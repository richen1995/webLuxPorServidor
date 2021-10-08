/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Profservicio;
import entidades.Profservicio;
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
public class ProfservicioFacade extends AbstractFacade<Profservicio> implements ProfservicioFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProfservicioFacade() {
        super(Profservicio.class);
    }
    
    @Override
    public List<Profservicio> obtenerprofesionalesdeservicio(String codigosrv){
        List<Profservicio> listprofservicio = new ArrayList<Profservicio>();
        String consultaSQL = null;
        try{
            consultaSQL = "SELECT m FROM Profservicio m WHERE m.srvId = :codsrv";
            Servicio servicio = new Servicio();
            servicio.setSrvId(codigosrv);
            Query query = em.createQuery(consultaSQL);
            query.setParameter("codsrv",servicio);
            listprofservicio = query.getResultList();
            if (!listprofservicio.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }
        return listprofservicio;
    
    }
}
