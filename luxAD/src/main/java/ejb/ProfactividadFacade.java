/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejb;

import entidades.Cotizacion;
import entidades.Profactividad;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TemporalType;
import java.util.Date;

/**
 *
 * @author Richard
 */
@Stateless
public class ProfactividadFacade extends AbstractFacade<Profactividad> implements ProfactividadFacadeLocal {

    @PersistenceContext(unitName = "com.mycompany_luxAD_war_1.0-SNAPSHOTPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProfactividadFacade() {
        super(Profactividad.class);
    }
    
    @Override
    public List<Profactividad> obtenerVisitasPorProf(String codprof, String estado, String tipo){
        List<Profactividad> listProfactividad = new ArrayList<Profactividad>();
        String consulta = null;
        try{
            consulta = "SELECT p FROM Profactividad p WHERE p.profId.profId = :codprf AND p.actId.actEstado = :estado AND p.actId.actTipo = :tipo";
            Query query = em.createQuery(consulta);
            query.setParameter("codprf",codprof);
            query.setParameter("estado",estado);
            query.setParameter("tipo",tipo);
            listProfactividad = query.getResultList();
            if (!listProfactividad.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listProfactividad;
    }
    
    @Override
    public List<Profactividad> obtenerActPorFech(String codprof, String fecha){
        List<Profactividad> listProfactividad = new ArrayList<Profactividad>();
        String consulta = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        try{
            Date fechaconfig = formato.parse(fecha);
            consulta = "SELECT p FROM Profactividad p WHERE p.actId.actFechaini = :fecha AND p.profId.profId = :codprf";
                        //SELECT p FROM Profactividad p where p.actId.actFechaini = "2021-07-24" AND p.profId.profId = "1804596854T"
            Query query = em.createQuery(consulta);
            query.setParameter("codprf",codprof);
            query.setParameter("fecha", fechaconfig, TemporalType.DATE);
            listProfactividad = query.getResultList();
            if (!listProfactividad.isEmpty()) 
                System.out.println("La cadena de consulta esta vacia");
        }catch(Exception e){
            System.out.println("Consulta Fallidad");
            System.out.println("ERROR: " + e);
        }   
        return listProfactividad;
    }
}
